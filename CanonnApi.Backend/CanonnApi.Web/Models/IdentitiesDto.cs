using Newtonsoft.Json;

namespace CanonnApi.Web.Models
{
	public class IdentitiesDto
	{
		public string Provider { get; set; }
		[JsonProperty("user_id")]
		public string UserId { get; set; }
		public string Connection { get; set; }
		public bool IsSocial { get; set; }
	}
}
