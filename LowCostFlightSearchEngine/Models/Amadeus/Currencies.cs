﻿using System.Text.Json.Serialization;

namespace LowCostFlightSearchEngine.Models.Amadeus
{
    public class Currencies
    {
        [JsonPropertyName("EUR")]
        public string EUR { get; set; }
    }
}
