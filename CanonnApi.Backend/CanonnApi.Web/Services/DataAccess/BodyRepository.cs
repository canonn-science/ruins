﻿using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using CanonnApi.Web.DatabaseModels;

namespace CanonnApi.Web.Services.DataAccess
{
	public class BodyRepository : BaseDataRepository<Body>, IBodyRepository
	{ 
		public BodyRepository(RuinsContext context)
			: base (context)
		{
		}

		protected override DbSet<Body> DbSet()
		{
			return RuinsContext.Body;
		}

		protected override void MapValues(Body source, Body target)
		{
			target.SystemId = source.SystemId;
			target.Name = source.Name;
			target.Distance = source.Distance;
			target.EdsmExtId = source.EdsmExtId;
			target.EddbExtId = source.EddbExtId;
		}

		public async Task<IEnumerable<Body>> GetAllWithSystems()
		{
			return await RuinsContext.Body.Include(b => b.System).ToListAsync();
		}
	}
}
