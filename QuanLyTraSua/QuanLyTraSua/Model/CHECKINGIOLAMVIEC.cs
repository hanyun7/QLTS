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
    
    public partial class CHECKINGIOLAMVIEC
    {
        public int MSNV { get; set; }
        public System.DateTime NGAYCHECKIN { get; set; }
        public System.DateTime THOIGIANVAOCA { get; set; }
        public System.DateTime THOIGIANKETTHUCCA { get; set; }
        public System.Nullable<int> TRANGTHAI { get; set; }
        public bool TRE { get; set; }
        public bool SOM { get; set; }
    
        public virtual NHANVIEN NHANVIEN { get; set; }
    }
}