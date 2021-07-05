using System.Text.Json.Serialization;

namespace LowCostFlightSearchEngine.Models.Amadeus
{
    public class IncludedCheckedBags
    {
        [JsonPropertyName("weight")]
        public int Weight { get; set; }

        [JsonPropertyName("weightUnit")]
        public string WeightUnit { get; set; }
    }
}
