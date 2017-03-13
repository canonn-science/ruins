﻿using System;
using System.Collections.Generic;

namespace RuinsApi.DatabaseModels
{
    public partial class ActiveObelisk
    {
        public int Id { get; set; }
        public DateTime Created { get; set; }
        public int ObeliskId { get; set; }
        public DateTime Updated { get; set; }
        public int VariantId { get; set; }

        public virtual Obelisk Obelisk { get; set; }
        public virtual LayoutVariant Variant { get; set; }
    }
}