using System.Text.Json.Serialization;

namespace LowCostFlightSearchEngine.Models.Amadeus
{
    public class Links
    {
        [JsonPropertyName("self")]
        public string Self { get; set; }
    }
}
