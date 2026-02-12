using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace ONE_PIECE_API_App.Model
{
    public class Fruit
    {
        [JsonProperty("name")]
        public string? FruitName { get; set; }

        [JsonProperty("type")]
        public string? FruitType { get; set; }
    }
}
