using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Extensions
/// </summary>
/// 

namespace ExtensionMethods {
    public static class MyExtensions {
        public static string TrimEnd(this string source, string value) {
            if (!source.EndsWith(value))
                return source;

            return source.Remove(source.LastIndexOf(value));
        }
    }
}