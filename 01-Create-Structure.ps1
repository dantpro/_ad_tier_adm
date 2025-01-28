# Script to create an OU structure from an array of hashtables

$OUs = @(
    @{
        name="Corp";
        path="DC=contoso,DC=lab"
    },
    @{
        name="Disabled Users";
        path="DC=contoso,DC=lab"
    },
    @{
        name="Users";
        path="OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Service";
        path="OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Administration";
        path="OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Computers";
        path="OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Tier 2";
        path="OU=Computers,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Tier 1";
        path="OU=Computers,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Tier 0";
        path="OU=Computers,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Terminal servers";
        path="OU=Computers,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Privileged Access Workstations";
        path="OU=Tier 0,OU=Computers,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="PKI";
        path="OU=Tier 0,OU=Computers,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Shared";
        path="OU=Tier 2,OU=Computers,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Desktops";
        path="OU=Tier 2,OU=Computers,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Laptops";
        path="OU=Tier 2,OU=Computers,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Privileged Access Workstations";
        path="OU=Tier 1,OU=Computers,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Network";
        path="OU=Tier 1,OU=Computers,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Application";
        path="OU=Tier 1,OU=Computers,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="File";
        path="OU=Tier 1,OU=Computers,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Update";
        path="OU=Tier 1,OU=Computers,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Adelaide";
        path="OU=Users,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Melbourne";
        path="OU=Users,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Sydney";
        path="OU=Users,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Perth";
        path="OU=Users,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Brisbane";
        path="OU=Users,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Offsite";
        path="OU=Users,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Contractors";
        path="OU=Users,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Tier 0";
        path="OU=Service,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Tier 1";
        path="OU=Service,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Users";
        path="OU=Tier 0,OU=Service,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Users";
        path="OU=Tier 1,OU=Service,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Tier 0";
        path="OU=Administration,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Tier 1";
        path="OU=Administration,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Tier 2";
        path="OU=Administration,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Users";
        path="OU=Tier 0,OU=Administration,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Users";
        path="OU=Tier 1,OU=Administration,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Users";
        path="OU=Tier 2,OU=Administration,OU=Corp,DC=contoso,DC=lab"
    }
)

$Containers = @(
    @{
        name="Security groups";
        path="OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Access Control";
        path="CN=Security groups,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Roles";
        path="CN=Security groups,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Access Control";
        path="OU=Tier 0,OU=Administration,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Roles";
        path="OU=Tier 0,OU=Administration,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Access Control";
        path="OU=Tier 1,OU=Administration,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Roles";
        path="OU=Tier 1,OU=Administration,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Access Control";
        path="OU=Tier 2,OU=Administration,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Roles";
        path="OU=Tier 2,OU=Administration,OU=Corp,DC=contoso,DC=lab"
    }
    @{
        name="Access Control";
        path="OU=Tier 1,OU=Service,OU=Corp,DC=contoso,DC=lab"
    },
    @{
        name="Access Control";
        path="OU=Tier 0,OU=Service,OU=Corp,DC=contoso,DC=lab"
    }
)

Foreach ($OU in $OUs)
{
    Write-Host "Creating OU"$OU['name']"in"$OU['path']
    New-ADOrganizationalUnit -Name $OU['name'] -Path $OU['path']
    if (! (Get-ADObject -Identity $OU['path'])) {
        Write-Host -ForegroundColor Red -BackgroundColor Black "ERROR : OU $OU['path'] was not created"
    }
}

Foreach ($Container in $Containers)
{
    Write-Host "Creating Container"$Container['name']"in"$Container['path']
    New-AdObject -Name $Container['name'] -Type container -path $Container['path'] -ProtectedFromAccidentalDeletion $true
    if (! (Get-ADObject -Identity $Container['path'])) {
        Write-Host -ForegroundColor Red -BackgroundColor Black "ERROR : Container $Container['path'] was not created"
    }
}