using System.Collections.Generic;
using System.Text.Json.Serialization;

namespace LowCostFlightSearchEngine.Models.Amadeus
{
    public class Itinerary
    {
        [JsonPropertyName("duration")]
        public string Duration { get; set; }

        [JsonPropertyName("segments")]
        public List<Segment> Segments { get; set; }
    }
}
