﻿using System;
using System.IdentityModel.Tokens.Jwt;

namespace CanonnApi.Web.Services
{
	public interface IIdTokenProvider
	{
		string GetIdToken();

		JwtSecurityToken GetParsedToken();
		JwtSecurityToken GetParsedToken(string idToken);

		DateTime GetTokenExpiry();
		DateTime GetTokenExpiry(string idToken);
		DateTime GetTokenExpiry(JwtSecurityToken idToken);
	}
}