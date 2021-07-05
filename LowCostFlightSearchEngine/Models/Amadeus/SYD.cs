using System.Text.Json.Serialization;

namespace LowCostFlightSearchEngine.Models.Amadeus
{
    public class SYD
    {
        [JsonPropertyName("cityCode")]
        public string CityCode { get; set; }

        [JsonPropertyName("countryCode")]
        public string CountryCode { get; set; }
    }
}
