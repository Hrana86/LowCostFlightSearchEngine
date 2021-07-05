using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;

namespace LowCostFlightSearchEngine.Repo
{
    public class AmadeusRepository
    {
        public async Task<string> GetFlightsAsync(string origin, string destination, string departureDate, string returnDate, string currency, int passengers, string token)
        {
            string url = $"https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode={origin}&destinationLocationCode={destination}&departureDate={departureDate}&adults={passengers}&currencyCode={currency}";

            if (!string.IsNullOrEmpty(returnDate))
            {
                url += $"&returnDate={returnDate}";
            }

            using var client = new HttpClient();
            client.DefaultRequestHeaders.Clear();
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
            using var response = await client.GetAsync(url);
            if (response.IsSuccessStatusCode)
            {
                return await response.Content.ReadAsStringAsync();
            }

            return "";
        }
    }
}
