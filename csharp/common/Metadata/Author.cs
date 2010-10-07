﻿/* 
 Copyright (c) 2010, NHIN Direct Project
 All rights reserved.

 Authors:
    Arien Malec     arien.malec@nhindirect.org
  
Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
Neither the name of the The NHIN Direct Project (nhindirect.org). nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Mail;

namespace NHINDirect.Metadata
{
    /// <summary>
    /// Represents the author of a document
    /// </summary>
    /// <example>
    /// <code>
    /// Author a = new Author() {First = "Tom", Last = "Jones"};
    /// </code>
    /// </example>
    public class Author
    {
        /// <summary>
        /// The author (if the author is a person)
        /// </summary>
        public Person Person { get; set; }

        private List<Institution> m_inst = new List<Institution>();
        /// <summary>
        /// Institutions author is affiliated with.
        /// </summary>
        public List<Institution> Institutions { get { return m_inst; } }

        private List<string> m_roles = new List<string>();
        /// <summary>
        /// Roles for this author
        /// </summary>
        public List<string> Roles { get { return m_roles; } }


        private List<string> m_spec = new List<string>();
        /// <summary>
        /// Uncoded specialities for this author
        /// </summary>
        public List<string> Specialities { get { return m_spec; } }

        /// <summary>
        /// The Health Internet Address of the author
        /// </summary>
        public MailAddress HealthInternetAddress { get; set; }
    }
}