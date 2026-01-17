#!/bin/bash

DOMAIN="$1"

whois "$DOMAIN" | awk -F: '
BEGIN {
    OFS=","
}

/^Registrant Name/        {print "RegistrantName",$2}
/^Registrant Organization/{print "RegistrantOrganization",$2}
/^Registrant Street/      {print "RegistrantStreet",$2" "}
/^Registrant City/        {print "RegistrantCity",$2}
/^Registrant State\/Province/ {print "RegistrantState/Province",$2}
/^Registrant Postal Code/ {print "RegistrantPostalPostalCode",$2}
/^Registrant Country/     {print "RegistrantCountry",$2}
/^Registrant Phone/ && !/Ext/ {print "RegistrantPhone",$2}
/^Registrant Phone Ext/   {print "RegistrantPhonePhoneExt:",$2}
/^Registrant Fax/ && !/Ext/ {print "RegistrantFax",$2}
/^Registrant Fax Ext/     {print "RegistrantFaxFaxExt:",$2}
/^Registrant Email/       {print "RegistrantEmail",$2}

/^Admin Name/              {print "AdminName",$2}
/^Admin Organization/      {print "AdminOrganization",$2}
/^Admin Street/            {print "AdminStreet",$2" "}
/^Admin City/              {print "AdminCity",$2}
/^Admin State\/Province/   {print "AdminState/Province",$2}
/^Admin Postal Code/       {print "AdminPostalPostalCode",$2}
/^Admin Country/           {print "AdminCountry",$2}
/^Admin Phone/ && !/Ext/   {print "AdminPhone",$2}
/^Admin Phone Ext/         {print "AdminPhonePhoneExt:",$2}
/^Admin Fax/ && !/Ext/     {print "AdminFax",$2}
/^Admin Fax Ext/           {print "AdminFaxFaxExt:",$2}
/^Admin Email/             {print "AdminEmail",$2}

/^Tech Name/              {print "TechName",$2}
/^Tech Organization/      {print "TechOrganization",$2}
/^Tech Street/            {print "TechStreet",$2" "}
/^Tech City/              {print "TechCity",$2}
/^Tech State\/Province/   {print "TechState/Province",$2}
/^Tech Postal Code/       {print "TechPostalPostalCode",$2}
/^Tech Country/           {print "TechCountry",$2}
/^Tech Phone/ && !/Ext/   {print "TechPhone",$2}
/^Tech Phone Ext/         {print "TechPhonePhoneExt:",$2}
/^Tech Fax/ && !/Ext/     {print "TechFax",$2}
/^Tech Fax Ext/           {print "TechFaxFaxExt:",$2}
/^Tech Email/             {print "TechEmail",$2}
' > "$DOMAIN.csv"
