codeunit 6188510 "ForNAV Local Printers"
{
    [EventSubscriber(ObjectType::Codeunit, CodeUnit::ReportManagement, 'OnAfterSetupPrinters', '', false, false)]
    local procedure OnAfterSetupPrinters(var Printers: Dictionary of [Text[250], JsonObject]);
    var
        localPrinters: Record "ForNAV Local Printer";
    begin
        if localPrinters.FindSet() then
            repeat
                Printers.Add(localPrinters."Cloud Printer Name", localPrinters.PrinterPayLoad());
            until localPrinters.Next() <> 1;
    end;

    [EventSubscriber(ObjectType::CodeUnit, Codeunit::"ForNAV OnPrem Report Mgt", 'GetLocalPrinter', '', false, false)]
    local procedure GetLocalPrinter(CloudPrinterName: Text[250]; var LocalPrinterName: Text; var PrinterSettings: Text)
    var
        localPrinters: Record "ForNAV Local Printer";
        reportManagement: codeunit ReportManagement;
        printers: Dictionary of [Text[250], JsonObject];
    begin
        if not LocalPrinters.GetLocalPrinter(CloudPrinterName, LocalPrinterName, PrinterSettings) then begin
            reportManagement.SetupPrinters(printers);
            if not printers.ContainsKey(CloudPrinterName) then
                LocalPrinterName := CloudPrinterName;
        end;
    end;
}
