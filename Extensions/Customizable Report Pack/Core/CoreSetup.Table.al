table 6189101 "ForNAV Core Setup"
{

    fields
    {
        field(1; "Primary Key"; Code[1]) { DataClassification = SystemMetadata; }
        field(2; "Service Endpoint ID"; Text[250]) { DataClassification = SystemMetadata; }
        field(3; "Endpoint Settings"; Text[250]) { DataClassification = SystemMetadata; }
        field(99; Blob; Blob) { DataClassification = SystemMetadata; }
    }

    keys { key(PK; "Primary Key") { Clustered = true; } }

    procedure ToBase64String(): Text
    var
        base64convert: Codeunit "Base64 Convert";
        is: InStream;
    begin
        Blob.CreateInStream(is);
        exit(base64convert.ToBase64(is));
    end;

    procedure FromBase64String(Base64String: Text)
    var
        base64convert: Codeunit "Base64 Convert";
        os: OutStream;
    begin
        Blob.CreateOutStream(os);
        base64convert.FromBase64(Base64String, os);
    end;
}