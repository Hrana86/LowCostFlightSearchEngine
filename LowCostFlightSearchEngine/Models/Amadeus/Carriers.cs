using System.Text.Json.Serialization;

namespace LowCostFlightSearchEngine.Models.Amadeus
{
    public class Carriers
    {
        [JsonPropertyName("PR")]
        public string PR { get; set; }
    }
}
