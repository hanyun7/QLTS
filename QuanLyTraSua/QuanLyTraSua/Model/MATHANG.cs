//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QuanLyTraSua.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class MATHANG
    {
        public int MSMH { get; set; }
        public string TENMH { get; set; }
        public string SIZE { get; set; }
        public int GIABAN { get; set; }
        public int MSLMH { get; set; }
        public bool ACTIVE { get; set; }
    
        public virtual LOAIMATHANG LOAIMATHANG { get; set; }
    }
}
