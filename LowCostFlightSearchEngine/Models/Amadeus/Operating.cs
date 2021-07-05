﻿using System.Text.Json.Serialization;

namespace LowCostFlightSearchEngine.Models.Amadeus
{
    public class Operating
    {
        [JsonPropertyName("carrierCode")]
        public string CarrierCode { get; set; }
    }
}
