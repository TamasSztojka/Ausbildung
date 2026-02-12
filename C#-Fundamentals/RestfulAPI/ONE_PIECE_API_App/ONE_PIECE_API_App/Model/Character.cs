using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace ONE_PIECE_API_App.Model
{

    public class Character
    {
        [JsonProperty("id")]
        public int CharacterIdentifier { get; set; }

        [JsonProperty("name")]
        public string? CharacterName { get; set; }

        [JsonProperty("bounty")]
        public string? CharacterBounty { get; set; }

        [JsonProperty("fruit")]
        public Fruit? DevilFruit { get; set; }
    }
}
