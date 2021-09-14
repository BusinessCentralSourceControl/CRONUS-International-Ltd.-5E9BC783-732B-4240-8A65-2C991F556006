codeunit 6189111 "ForNAV OnPrem Report Mgt"
{
    procedure ConvertLayout(var TempBlob: Codeunit "Temp Blob"): Boolean
    begin
        exit(true);
    end;

    procedure IsForNavPreview(): Boolean;
    var
        ReportLayoutSelection: Record "Report Layout Selection";
    begin
        EXIT(ReportLayoutSelection.GetTempLayoutSelected <> '');
    end;

    procedure GetRdlcLayout(reportNo: Integer; var tempBlob: Record "ForNAV Core Setup"; var customCode: Code[20]): Boolean
    var
        CustomReportLayout: Record "Custom Report Layout";
        ReportLayoutSelection: Record "Report Layout Selection";
        os: OutStream;
        is: InStream;
        f: File;
        layoutCode: Code[20];
    begin
        if ReportLayoutSelection.HasCustomLayout(reportNo) = 1 then begin
            layoutCode := ReportLayoutSelection.GetTempLayoutSelected();
            if layoutCode = '' then layoutCode := ReportLayoutSelection."Custom Report Layout Code";
            if CustomReportLayout.Get(layoutCode) then begin
                CustomReportLayout.CalcFields(Layout);
                if CustomReportLayout.Layout.HasValue then begin
                    customCode := layoutCode;
                    CustomReportLayout.Layout.CreateInStream(is);
                    tempBlob.Blob.CreateOutStream(os);
                    CopyStream(os, is);
                    exit(true);
                end;
            end;
        end;

        if REPORT.RdlcLayout(reportNo, is) then begin
            customCode := GetUniqueCustomLayoutCode();
            tempBlob.Blob.CreateOutStream(os);
            CopyStream(os, is);
            exit(true);
        end;
    end;

    procedure GetUniqueCustomLayoutCode(): Code[20];
    var
        retv: Code[20];
    begin
        retv := CopyStr(DelChr(CreateGuid(), '=', '{}-'), 1, 20);
        //retv := CopyStr(CreateGuid(), 1, 20);
        exit(retv);
    end;

    procedure GetDesignPackage(reportNo: Integer; var packageBlob: Record "ForNAV Core Setup"): Boolean
    var
        serviceUrl: Text;
        tempBlob: Record "ForNAV Core Setup";
        os: OutStream;
        is: InStream;
        chr: Char;
        customCode: Code[20];
        previewUrl: Text;
        webserviceUrl: Text;
        session: Record "ForNAV OnPrem Report Sessions" temporary;
        ReportLayoutSelection: Record "Report Layout Selection";
        CustomReportLayout: Record "Custom Report Layout";
        cloudSessionRef: RecordRef;
        sessionRef: RecordRef;
        allObjects: Record AllObj;
        bt: BigText;
        rdlc: Text;
        startDescription: Integer;
        endDescription: Integer;
    begin
        if not allObjects.Get(ObjectType::Table, 6189100) then // "ForNAV Cloud Report Sessions"
            Error('The ForNAV designer need to be setup - please enter the Designer and setup the connnection');
        cloudSessionRef.Open(6189100); // "ForNAV Cloud Report Sessions" 
        // Remove old sessions
        // session.Init();
        // session.SetRange(Created, CreateDateTime(0D, 0T), CurrentDateTime - (3600 * 24 * 10));
        // session.DeleteAll(false);
        cloudSessionRef.Init();
        cloudSessionRef.Field(3).SetRange(CreateDateTime(0D, 0T), CurrentDateTime - (3600 * 24 * 10));
        cloudSessionRef.DeleteAll();
        // Remove old preview layouts
        CustomReportLayout.Init();
        CustomReportLayout.SetRange("Last Modified", CreateDateTime(0D, 0T), CurrentDateTime - 600);
        CustomReportLayout.SetFilter(Description, 'ForNAV BC preview *');
        CustomReportLayout.DeleteAll();

        // Create new session
        session.Init;
        session."Session ID" := CreateGuid;
        session."Report ID" := reportNo;
        session.Created := CURRENTDATETIME;
        session.PreviewLayoutCode := GetUniqueCustomLayoutCode();
        //        session.Insert;
        cloudSessionRef.Init();
        cloudSessionRef.Field(1).Value(session."Session ID");
        cloudSessionRef.Field(2).Value(session."Report ID");
        cloudSessionRef.Field(3).Value(session.Created);
        cloudSessionRef.Field(4).Value(session.PreviewLayoutCode);
        cloudSessionRef.Insert();
        // Make sure there is a record in the report selection table 
        if not ReportLayoutSelection.Get(reportNo, CompanyName) then begin
            ReportLayoutSelection.Init();
            ReportLayoutSelection."Report ID" := reportNo;
            ReportLayoutSelection.Type := ReportLayoutSelection.Type::"RDLC (built-in)";
            ReportLayoutSelection.Insert(true);
        end;

        Commit;

        //IF CONFIRM(session."Session ID") THEN;
        serviceUrl := GetUrl(CLIENTTYPE::Api, CompanyName, OBJECTTYPE::Page, 6189112);
        previewUrl := GetUrl(CLIENTTYPE::Current, CompanyName, OBJECTTYPE::Page, 6189100, cloudSessionRef);
        webserviceUrl := GetUrl(CLIENTTYPE::SOAP, CompanyName, OBJECTTYPE::Codeunit, 6189102);
        if webServiceUrl = '' then begin
            CreateWebService;
            WebServiceUrl := GetUrl(CLIENTTYPE::SOAP, CompanyName, OBJECTTYPE::Codeunit, 6189102);
        end;

        chr := 13;
        if GetRdlcLayout(reportNo, tempBlob, customCode) then begin
            packageBlob.Blob.CreateOutStream(os, TextEncoding::UTF8);
            os.WriteText('V3');
            os.WriteText(Format(chr, 0, '<CHAR>'));

            // Session ID
            os.WriteText(session."Session ID");
            os.WriteText(Format(chr, 0, '<CHAR>'));

            // Preview layout code
            os.WriteText(session.PreviewLayoutCode);
            os.WriteText(Format(chr, 0, '<CHAR>'));

            // Service URL
            os.WriteText(serviceUrl);
            os.WriteText(Format(chr, 0, '<CHAR>'));

            // Preview URL
            os.WriteText(previewUrl);
            os.WriteText(Format(chr, 0, '<CHAR>'));

            // Seb Service URL
            os.WriteText(webserviceUrl);
            os.WriteText(Format(chr, 0, '<CHAR>'));

            // Custom Layout Code
            os.WriteText(customCode);
            os.WriteText(Format(chr, 0, '<CHAR>'));

            // Report No
            os.WriteText(Format(reportNo, 0, 9));
            os.WriteText(Format(chr, 0, '<CHAR>'));

            // Company Name
            os.WriteText(CompanyName);
            os.WriteText(Format(chr, 0, '<CHAR>'));

            // Rdlc
            os.WriteText('Rdlc');
            os.WriteText(Format(chr, 0, '<CHAR>'));

            // Sql instance LAPTOP-LKMT0SP1\BCDEMO
            os.WriteText('');
            os.WriteText(Format(chr, 0, '<CHAR>'));

            // database Demo Database BC (14-0)
            os.WriteText('');
            os.WriteText(Format(chr, 0, '<CHAR>'));

            // FinSql path C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\140\RoleTailored Client\finsql.exe
            os.WriteText('');
            os.WriteText(Format(chr, 0, '<CHAR>'));

            // layout
            tempBlob.Blob.CreateInStream(is);
            bt.Read(is);
            rdlc := Format(bt);
            startDescription := StrPos(rdlc, '<Description>');
            if startDescription = 0 then
                Error('The layout is not a ForNAV layout');
            startDescription += StrLen('<Description>');
            endDescription := StrPos(rdlc, '</Description>');
            os.WriteText(CopyStr(rdlc, startDescription, endDescription - startDescription));
            exit(true);
        end;
    end;

    procedure LaunchDesigner(ReportID: Integer): Boolean;
    var
        ForNAVCoreSetup: Record "ForNAV Core Setup" temporary;
        fileName: Text;
        is: InStream;
    begin
        if not IsForNavPreview then begin
            if GetDesignPackage(ReportID, ForNAVCoreSetup) then begin
                ForNAVCoreSetup.Blob.CREATEINSTREAM(is);
                fileName := FORMAT(ReportID) + '.fornavdesign';
                DOWNLOADFROMSTREAM(is, '', '', '', fileName);
            end;
            exit(true);
        end;
    end;

    procedure LaunchDesigner(ReportID: Integer; IgnoreIsPreview: Boolean): Boolean;
    var
        ForNAVCoreSetup: Record "ForNAV Core Setup" temporary;
        fileName: Text;
        is: InStream;
    begin
        if GetDesignPackage(ReportID, ForNAVCoreSetup) then begin
            ForNAVCoreSetup.Blob.CREATEINSTREAM(is);
            fileName := FORMAT(ReportID) + '.fornavdesign';
            DOWNLOADFROMSTREAM(is, '', '', '', fileName);
        end;
        exit(true);
    end;

    procedure WriteDesignPackage(os: OutStream; type: Text; cloudSessionRef: RecordRef; customCode: Text; reportNo: Integer)
    var
        chr: Char;
        serviceUrl: Text;
        previewUrl: Text;
        webserviceUrl: Text;
        session: Record "ForNAV OnPrem Report Sessions" temporary;
    begin
        chr := 13;
        serviceUrl := GetUrl(CLIENTTYPE::Api, CompanyName, OBJECTTYPE::Page, 6189112);
        previewUrl := GetUrl(CLIENTTYPE::Current, CompanyName, OBJECTTYPE::Page, 6189100, cloudSessionRef);
        webserviceUrl := GetUrl(CLIENTTYPE::SOAP, CompanyName, OBJECTTYPE::Codeunit, 6189102);
        if webServiceUrl = '' then begin
            CreateWebService;
            webServiceUrl := GetUrl(CLIENTTYPE::SOAP, CompanyName, OBJECTTYPE::Codeunit, 6189102);
        end;

        os.WriteText('V3');
        os.WriteText(Format(chr, 0, '<CHAR>'));

        // Session ID
        session."Session ID" := cloudSessionRef.Field(1).Value();
        os.WriteText(session."Session ID");
        os.WriteText(Format(chr, 0, '<CHAR>'));

        // Preview layout code
        session.PreviewLayoutCode := cloudSessionRef.Field(4).Value();
        os.WriteText(session.PreviewLayoutCode);
        os.WriteText(Format(chr, 0, '<CHAR>'));

        // Service URL
        os.WriteText(serviceUrl);
        os.WriteText(Format(chr, 0, '<CHAR>'));

        // Preview URL
        os.WriteText(previewUrl);
        os.WriteText(Format(chr, 0, '<CHAR>'));

        // Seb Service URL
        os.WriteText(webserviceUrl);
        os.WriteText(Format(chr, 0, '<CHAR>'));

        // Custom Layout Code
        os.WriteText(customCode);
        os.WriteText(Format(chr, 0, '<CHAR>'));

        // Report No
        os.WriteText(Format(reportNo, 0, 9));
        os.WriteText(Format(chr, 0, '<CHAR>'));

        // Company Name
        os.WriteText(CompanyName);
        os.WriteText(Format(chr, 0, '<CHAR>'));

        // package type
        os.WriteText(type);
        os.WriteText(Format(chr, 0, '<CHAR>'));

        // Servername
        os.WriteText(Format(chr, 0, '<CHAR>'));

        // Databasename
        os.WriteText(Format(chr, 0, '<CHAR>'));

        // finsql
        os.WriteText(Format(chr, 0, '<CHAR>'));
    end;

    procedure CreateSession(reportNo: Integer; var cloudSessionRef: RecordRef)
    var
        session: Record "ForNAV OnPrem Report Sessions" temporary;
    begin
        cloudSessionRef.Open(6189100); // "ForNAV Cloud Report Sessions" 
        // Remove old sessions
        cloudSessionRef.Init();
        cloudSessionRef.Field(3).SetRange(CreateDateTime(0D, 0T), CurrentDateTime - (3600 * 24 * 10));
        cloudSessionRef.DeleteAll();
        // Create new session
        session.Init;
        session."Session ID" := CreateGuid;
        session."Report ID" := reportNo;
        session.Created := CURRENTDATETIME;
        session.PreviewLayoutCode := GetUniqueCustomLayoutCode();
        //        session.Insert;
        cloudSessionRef.Init();
        cloudSessionRef.Field(1).Value(session."Session ID");
        cloudSessionRef.Field(2).Value(session."Report ID");
        cloudSessionRef.Field(3).Value(session.Created);
        cloudSessionRef.Field(4).Value(session.PreviewLayoutCode);
        cloudSessionRef.Insert();
    end;

    procedure DownloadDesignPackage(packagetype: Text): Boolean
    var
        AllObj: Record AllObj;
        packageBlob: Record "ForNAV Core Setup";
        serviceUrl: Text;
        previewUrl: Text;
        webserviceUrl: Text;
        os: OutStream;
        tempBlob: Record "ForNAV Core Setup";
        is: InStream;
        downloadStream: InStream;
        chr: Char;
        customCode: Code[20];
        CustomReportLayout: Record "Custom Report Layout";
        fileName: Text;
        ReportNumber: Integer;
        cloudSessionRef: RecordRef;
    begin
        packageBlob.Blob.CreateOutStream(os, TextEncoding::UTF8);
        case packagetype of
            'New':
                begin
                    AllObj.SetRange(AllObj."Object Type", AllObj."Object Type"::Report);
                    AllObj.SetRange(AllObj."Object ID", 50000, 99999);
                    ReportNumber := 50000;
                    if AllObj.FindFirst then begin
                        while ReportNumber = AllObj."Object ID" do begin
                            ReportNumber += 1;
                            AllObj.next();
                            if AllObj."Object ID" = 99999 then
                                error('there is no numbers left in the freerange to create a new report');
                        end;
                    end;
                    CreateSession(ReportNumber, cloudSessionRef);
                    Commit;
                    WriteDesignPackage(os, 'New', cloudSessionRef, '', ReportNumber);
                end;
            'DefaultSettings':
                WriteDesignPackage(os, 'DefaultSettings', cloudSessionRef, '', ReportNumber)
        end;
        packageBlob.Blob.CreateInStream(downloadStream);
        fileName := FORMAT(ReportNumber) + '.fornavdesign';
        DownloadFromStream(downloadStream, '', '', '', fileName);
    end;

    procedure DownloadDesignNewReportPackage()
    begin
        DownloadDesignPackage('New');
    end;

    procedure DownloadDesignerDefaultSettings()
    begin
        DownloadDesignPackage('DefaultSettings');
    end;

    procedure CreateWebService()
    var
        WebService: Record "Tenant Web Service";
    begin
        WebService."Object Type" := WebService."Object Type"::Codeunit;
        WebService."Object ID" := 6189102;
        WebService."Service Name" := 'ForNavBc';
        WebService.Insert;
        WebService.validate(Published, true);
        WebService.Modify;
        Commit;
    end;
    [IntegrationEvent(false, false)]
    local procedure GetLocalPrinter(CloudPrinterName: Text[250]; var LocalPrinterName: Text; var PrinterSettings: Text)
    begin
    end;
}
