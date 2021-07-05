using System.ComponentModel.DataAnnotations;

namespace LowCostFlightSearchEngine.Models
{
    public class Airport
    {
        [Key]
        public string IATA { get; set; }
        public string Name { get; set; }
    }
}
