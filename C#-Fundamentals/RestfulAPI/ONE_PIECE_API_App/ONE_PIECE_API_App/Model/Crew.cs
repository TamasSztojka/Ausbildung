using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace ONE_PIECE_API_App.Model
{
    public class Crew
    {
        [JsonProperty("id")]
        public int CrewIdentifier { get; set; }

        [JsonProperty("name")]
        public string? CrewName { get; set; }

        [JsonProperty("status")]
        public string? CrewStatus { get; set; }

        [JsonProperty("total_prime")]
        public string? CrewTotalBounty { get; set; }

        [JsonProperty("is_yonko")]
        public string? IsYonkoCrew { get; set; }
    }
}
