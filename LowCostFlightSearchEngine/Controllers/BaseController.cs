using LowCostFlightSearchEngine.Extensions;
using LowCostFlightSearchEngine.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Newtonsoft.Json;
using RestSharp;
using System;

namespace LowCostFlightSearchEngine.Controllers
{
    public class BaseController : Controller
    {
        private readonly string _clientId = "iZaHxwPK9gEpNtQd8zsSBhKaMfcuAzqJ";
        private readonly string _clientSecret = "JrBQ7b2fH6Ncieh1";

        public RestClient _restClient;

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            ApiTokenModel token = context.HttpContext.Session.GetObjectFromJson<ApiTokenModel>("token") ?? new();
            if (token.AccessToken is null || token.ExpirationTime >= DateTime.Now)
            {
                token = GenerateNewToken();
            }

            context.HttpContext.Session.SetObjectAsJson("token", token);

            _restClient = new RestClient();
            _restClient.AddDefaultHeader("Bearer", token.AccessToken);

            base.OnActionExecuting(context);
        }

        private ApiTokenModel GenerateNewToken()
        {
            var client = new RestClient("https://test.api.amadeus.com/v1/security/oauth2/token");
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);
            request.AddParameter("client_id", _clientId);
            request.AddParameter("client_secret", _clientSecret);
            request.AddParameter("grant_type", "client_credentials");
            IRestResponse response = client.Execute(request);

            if (response.IsSuccessful)
            {
                return JsonConvert.DeserializeObject<ApiTokenModel>(response.Content);
            }

            return new ApiTokenModel();
        }
    }
}
