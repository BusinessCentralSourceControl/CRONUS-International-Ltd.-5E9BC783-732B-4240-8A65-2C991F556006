// codeunit 6188514 "Temp Blob"
// {
//     var
//         TempBlobImpl: Codeunit "Temp Blob Impl.";

//     /// <summary>
//     /// Creates an InStream object with default encoding for the TempBlob. This enables you to read data from the TempBlob.
//     /// </summary>
//     /// <param name="InStream">The InStream variable passed as a VAR to which the BLOB content will be attached.</param>
//     procedure CreateInStream(var InStream: InStream)
//     begin
//         TempBlobImpl.CreateInStream(InStream);
//     end;

//     /// <summary>
//     /// Creates an InStream object with the specified encoding for the TempBlob. This enables you to read data from the TempBlob.
//     /// </summary>
//     /// <param name="InStream">The InStream variable passed as a VAR to which the BLOB content will be attached.</param>
//     /// <param name="Encoding">The text encoding to use.</param>
//     procedure CreateInStream(var InStream: InStream; Encoding: TextEncoding)
//     begin
//         TempBlobImpl.CreateInStream(InStream, Encoding);
//     end;

//     /// <summary>
//     /// Creates an OutStream object with default encoding for the TempBlob. This enables you to write data to the TempBlob.
//     /// </summary>
//     /// <param name="OutStream">The OutStream variable passed as a VAR to which the BLOB content will be attached.</param>
//     procedure CreateOutStream(var OutStream: OutStream)
//     begin
//         TempBlobImpl.CreateOutStream(OutStream);
//     end;

//     /// <summary>
//     /// Creates an OutStream object with the specified encoding for the TempBlob. This enables you to write data to the TempBlob.
//     /// </summary>
//     /// <param name="OutStream">The OutStream variable passed as a VAR to which the BLOB content will be attached.</param>
//     /// <param name="Encoding">The text encoding to use.</param>
//     procedure CreateOutStream(var OutStream: OutStream; Encoding: TextEncoding)
//     begin
//         TempBlobImpl.CreateOutStream(OutStream, Encoding);
//     end;

//     /// <summary>
//     /// Determines whether the TempBlob has a value.
//     /// </summary>
//     /// <returns>True if the TempBlob has a value.</returns>
//     procedure HasValue(): Boolean
//     begin
//         exit(TempBlobImpl.HasValue());
//     end;

//     /// <summary>
//     /// Determines the length of the data stored in the TempBlob.
//     /// </summary>
//     /// <returns>The number of bytes stored in the BLOB.</returns>
//     procedure Length(): Integer
//     begin
//         exit(TempBlobImpl.Length());
//     end;

//     /// <summary>
//     /// Copies the value of the BLOB field on the RecordVariant in the specified field to the TempBlob.
//     /// </summary>
//     /// <param name="RecordVariant">Any Record variable.</param>
//     /// <param name="FieldNo">The field number of the BLOB field to be read.</param>
//     procedure FromRecord(RecordVariant: Variant; FieldNo: Integer)
//     begin
//         TempBlobImpl.FromRecord(RecordVariant, FieldNo);
//     end;

//     /// <summary>
//     /// Copies the value of the BLOB field on the RecordRef in the specified field to the TempBlob.
//     /// </summary>
//     /// <param name="RecordRef">A RecordRef variable attached to a Record.</param>
//     /// <param name="FieldNo">The field number of the BLOB field to be read.</param>
//     procedure FromRecordRef(RecordRef: RecordRef; FieldNo: Integer)
//     begin
//         TempBlobImpl.FromRecordRef(RecordRef, FieldNo);
//     end;

//     /// <summary>
//     /// Copies the value of the TempBlob to the specified field on the RecordRef.
//     /// </summary>
//     /// <param name="RecordRef">A RecordRef variable attached to a Record.</param>
//     /// <param name="FieldNo">The field number of the Blob field to be written.</param>
//     procedure ToRecordRef(var RecordRef: RecordRef; FieldNo: Integer)
//     begin
//         TempBlobImpl.ToRecordRef(RecordRef, FieldNo);
//     end;

//     /// <summary>
//     /// Copies the value of the FieldRef to the TempBlob.
//     /// </summary>
//     /// <param name="BlobFieldRef">A FieldRef variable attached to a field for a record.</param>
//     procedure FromFieldRef(BlobFieldRef: FieldRef)
//     begin
//         TempBlobImpl.FromFieldRef(BlobFieldRef);
//     end;

//     /// <summary>
//     /// Copies the value of the TempBlob to the specified FieldRef.
//     /// </summary>
//     /// <param name="BlobFieldRef">A FieldRef variable attached to a field for a record.</param>
//     procedure ToFieldRef(var BlobFieldRef: FieldRef)
//     begin
//         TempBlobImpl.ToFieldRef(BlobFieldRef);
//     end;

//     // procedure ToTempBlobRec(var tb: Record TempBlob);
//     // begin
//     //     TempBlobImpl.ToTempBlobRec(tb);
//     // end;

//     // procedure FromTempBlobRec(var tb: Record TempBlob);
//     // begin
//     //     TempBlobImpl.FromTempBlobRec(tb);
//     // end;
// }
// codeunit 6188515 "Temp Blob Impl."
// {
//     var
//         TempBlob: Record "TempBlob" temporary;

//     procedure CreateInStream(var InStream: InStream)
//     begin
//         TempBlob.Blob.CreateInStream(InStream);
//     end;

//     procedure CreateInStream(var InStream: InStream; Encoding: TextEncoding)
//     begin
//         TempBlob.Blob.CreateInStream(InStream, Encoding);
//     end;

//     procedure CreateOutStream(var OutStream: OutStream)
//     begin
//         TempBlob.Blob.CreateOutStream(OutStream);
//     end;

//     procedure CreateOutStream(var OutStream: OutStream; Encoding: TextEncoding)
//     begin
//         TempBlob.Blob.CreateOutStream(OutStream, Encoding);
//     end;

//     procedure HasValue(): Boolean
//     begin
//         exit(TempBlob.Blob.HasValue());
//     end;

//     procedure Length(): Integer
//     begin
//         exit(TempBlob.Blob.Length());
//     end;

//     procedure FromRecord(RecordVariant: Variant; FieldNo: Integer)
//     var
//         RecordRef: RecordRef;
//     begin
//         RecordRef.GetTable(RecordVariant);
//         FromRecordRef(RecordRef, FieldNo);
//     end;

//     procedure FromRecordRef(RecordRef: RecordRef; FieldNo: Integer)
//     var
//         BlobFieldRef: FieldRef;
//     begin
//         BlobFieldRef := RecordRef.Field(FieldNo);
//         FromFieldRef(BlobFieldRef);
//     end;

//     procedure ToRecordRef(var RecordRef: RecordRef; FieldNo: Integer)
//     var
//         BlobFieldRef: FieldRef;
//     begin
//         BlobFieldRef := RecordRef.Field(FieldNo);
//         ToFieldRef(BlobFieldRef);
//     end;

//     procedure FromFieldRef(BlobFieldRef: FieldRef)
//     begin
//         TempBlob.Blob := BlobFieldRef.Value();
//         if not HasValue() then begin
//             BlobFieldRef.CalcField();
//             TempBlob.Blob := BlobFieldRef.Value()
//         end
//     end;

//     procedure ToFieldRef(var BlobFieldRef: FieldRef)
//     begin
//         BlobFieldRef.Value := TempBlob.Blob;
//     end;

//     procedure ToTempBlobRec(var tb: Record TempBlob);
//     var
//         is: InStream;
//         os: OutStream;
//     begin
//         tb.Blob.CreateOutStream(os);
//         TempBlob.Blob.CreateInStream(is);
//         CopyStream(os, is);
//     end;

//     procedure FromTempBlobRec(var tb: Record TempBlob);
//     var
//         is: InStream;
//         os: OutStream;
//     begin
//         TempBlob.Blob.CreateOutStream(os);
//         tb.Blob.CreateInStream(is);
//         CopyStream(os, is);
//     end;
// }
// // ------------------------------------------------------------------------------------------------
// // Copyright (c) Microsoft Corporation. All rights reserved.
// // Licensed under the MIT License. See License.txt in the project root for license information.
// // ------------------------------------------------------------------------------------------------

// /// <summary>
// /// The interface for storing sequences of variables, each of which stores BLOB data.
// /// </summary>
// codeunit 6188516 "Temp Blob List"
// {

//     var
//         TempBlobListImpl: Codeunit "Temp Blob List Impl.";

//     /// <summary>
//     /// Check if an element with the given index exists.
//     /// </summary>
//     /// <param name="Index">The index of the TempBlob in the list.</param>
//     /// <returns>True if an element at the given index exists.</returns>
//     procedure Exists(Index: Integer): Boolean
//     begin
//         exit(TempBlobListImpl.Exists(Index));
//     end;

//     /// <summary>
//     /// Returns the number of elements in the list.
//     /// </summary>
//     /// <returns>The number of elements in the list.</returns>
//     procedure "Count"(): Integer
//     begin
//         exit(TempBlobListImpl.Count());
//     end;

//     /// <summary>
//     /// Get an element from the list at any given position.
//     /// </summary>
//     /// <error>The index is larger than the number of elements in the list or less than one.</error>
//     /// <param name="Index">The index of the TempBlob in the list.</param>
//     /// <param name="TempBlob">The TempBlob to return.</param>
//     /// <returns>An element from the list at any given position.</returns>
//     procedure Get(Index: Integer; var TempBlob: Codeunit "Temp Blob")
//     begin
//         TempBlobListImpl.Get(Index, TempBlob);
//     end;

//     /// <summary>
//     /// Set an element at the given index from the parameter TempBlob.
//     /// </summary>
//     /// <error>The index is larger than the number of elements in the list or less than one.</error>
//     /// <param name="Index">The index of the TempBlob in the list.</param>
//     /// <param name="TempBlob">The TempBlob to set.</param>
//     /// <returns>True if successful.</returns>
//     procedure Set(Index: Integer; TempBlob: Codeunit "Temp Blob"): Boolean
//     begin
//         exit(TempBlobListImpl.Set(Index, TempBlob));
//     end;

//     /// <summary>
//     /// Remove the element at a specified location from a non-empty list.
//     /// </summary>
//     /// <error>The index is larger than the number of elements in the list or less than one.</error>
//     /// <param name="Index">The index of the TempBlob in the list.</param>
//     /// <returns>True if successful.</returns>
//     procedure RemoveAt(Index: Integer): Boolean
//     begin
//         exit(TempBlobListImpl.RemoveAt(Index));
//     end;

//     /// <summary>
//     /// Return true if the list is empty, otherwise return false.
//     /// </summary>
//     /// <returns>True if the list is empty.</returns>
//     procedure IsEmpty(): Boolean
//     begin
//         exit(TempBlobListImpl.IsEmpty());
//     end;

//     /// <summary>
//     /// Adds a TempBlob to the end of the list.
//     /// </summary>
//     /// <param name="TempBlob">The TempBlob to add.</param>
//     /// <returns>True if successful.</returns>
//     procedure Add(TempBlob: Codeunit "Temp Blob"): Boolean
//     begin
//         exit(TempBlobListImpl.Add(TempBlob));
//     end;

//     /// <summary>
//     /// Adds the elements of the specified TempBlobList to the end of the current TempBlobList object.
//     /// </summary>
//     /// <param name="TempBlobList">The TempBlob list to add.</param>
//     /// <returns>True if successful.</returns>
//     procedure AddRange(TempBlobList: Codeunit "Temp Blob List"): Boolean
//     begin
//         exit(TempBlobListImpl.AddRange(TempBlobList));
//     end;

//     /// <summary>
//     /// Get a copy of a range of elements in the list starting from index,
//     /// </summary>
//     /// <error>The index is larger than the number of elements in the list or less than one.</error>
//     /// <error>The range to return in not within the range of the list.</error>
//     /// <param name="Index">The index of the first object.</param>
//     /// <param name="ElemCount">The number of objects to be returned.</param>
//     /// <param name="TempBlobListOut">The TempBlobList to be returned passed as a VAR.</param>
//     procedure GetRange(Index: Integer; ElemCount: Integer; var TempBlobListOut: Codeunit "Temp Blob List")
//     begin
//         TempBlobListImpl.GetRange(Index, ElemCount, TempBlobListOut);
//     end;
// }
// // ------------------------------------------------------------------------------------------------
// // Copyright (c) Microsoft Corporation. All rights reserved.
// // Licensed under the MIT License. See License.txt in the project root for license information.
// // ------------------------------------------------------------------------------------------------

// codeunit 6188517 "Temp Blob List Impl."
// {
//     var
//         TempBlobRec: Record "TempBlob" temporary;
//         ObjectDoesNotExistErr: Label 'Object with index %1 does not exist.', Comment = '%1=Index of the object';
//         InvalidNoObjectsRequestedErr: Label 'There are not enough objects available to fulfill the request.';

//     procedure Exists(Index: Integer): Boolean
//     begin
//         exit(TempBlobRec.Get(Index));
//     end;

//     procedure "Count"(): Integer
//     begin
//         exit(TempBlobRec.Count());
//     end;

//     procedure Get(Index: Integer; var TempBlob: Codeunit "Temp Blob")
//     begin
//         // Not using Exists function from this codeunit as it is a reserved keyword
//         if not TempBlobRec.Get(Index) then
//             Error(ObjectDoesNotExistErr, Index);

//         TempBlob.FromRecord(TempBlobRec, TempBlobRec.FieldNo(Blob));
//     end;

//     procedure Set(Index: Integer; TempBlob: Codeunit "Temp Blob"): Boolean
//     begin
//         if not TempBlobRec.Get(Index) then
//             Error(ObjectDoesNotExistErr, Index);

//         TempBlobRec."Primary Key" := Index;
//         CopyBlob(TempBlob);
//         exit(TempBlobRec.Modify());
//     end;

//     procedure RemoveAt(Index: Integer): Boolean
//     var
//         TempBlobList: Codeunit "Temp Blob List";
//     begin
//         if not TempBlobRec.Get(Index) then
//             Error(ObjectDoesNotExistErr, Index);
//         if TempBlobRec.Get(Index + 1) then
//             GetRange(Index + 1, Count() - Index, TempBlobList);
//         TempBlobRec.SetFilter("Primary Key", '>=%1', Index);
//         TempBlobRec.DeleteAll();
//         TempBlobRec.Reset();
//         exit(AddRange(TempBlobList));
//     end;

//     procedure IsEmpty(): Boolean
//     begin
//         exit(TempBlobRec.IsEmpty());
//     end;

//     procedure Add(TempBlob: Codeunit "Temp Blob"): Boolean
//     begin
//         TempBlobRec."Primary Key" := Count() + 1;
//         CopyBlob(TempBlob);
//         exit(TempBlobRec.Insert());
//     end;

//     procedure AddRange(TempBlobList: Codeunit "Temp Blob List"): Boolean
//     var
//         TempBlob: Codeunit "Temp Blob";
//         Index: Integer;
//     begin
//         if TempBlobList.IsEmpty() then
//             exit(true);
//         for Index := 1 to TempBlobList.Count() do begin
//             TempBlobList.Get(Index, TempBlob);
//             if not Add(TempBlob) then
//                 exit(false);
//         end;

//         exit(true);
//     end;

//     procedure GetRange(Index: Integer; ElemCount: Integer; var TempBlobListOut: Codeunit "Temp Blob List")
//     var
//         TempBlob: Codeunit "Temp Blob";
//         TempBlobList: Codeunit "Temp Blob List";
//         Number: Integer;
//     begin
//         if Index + ElemCount > Count() + 1 then
//             Error(InvalidNoObjectsRequestedErr);

//         TempBlobRec.SetFilter("Primary Key", '>=%1', Index);
//         if not TempBlobRec.FindSet() then
//             Error(ObjectDoesNotExistErr, Index);
//         repeat
//             Get(TempBlobRec."Primary Key", TempBlob);
//             // TempBlobListOut parameter is only for output
//             // new variable is needed to ensure the function behaves the same no matter the TempBlobListOut input
//             TempBlobList.Add(TempBlob);
//             Number += 1;
//         until (TempBlobRec.Next() = 0) or (Number = ElemCount);
//         TempBlobRec.Reset();
//         TempBlobListOut := TempBlobList;
//     end;

//     local procedure CopyBlob(var TempBlob: Codeunit "Temp Blob")
//     var
//         RecordRef: RecordRef;
//     begin
//         Clear(TempBlobRec.Blob);
//         RecordRef.GetTable(TempBlobRec);
//         TempBlob.ToRecordRef(RecordRef, TempBlobRec.FieldNo(Blob));
//         RecordRef.SetTable(TempBlobRec);
//     end;
// }

// // ------------------------------------------------------------------------------------------------
// // Copyright (c) Microsoft Corporation. All rights reserved.
// // Licensed under the MIT License. See License.txt in the project root for license information.
// // ------------------------------------------------------------------------------------------------

// /// <summary>
// /// Exposes functionality to provide ability to create, update, read and dispose a binary data compression archive.
// /// This module supports compression and decompression with Zip format and GZip format.
// /// </summary>
// codeunit 6188518 "Data Compression"
// {
//     var
//         DataCompressionImpl: Codeunit "Data Compression Impl.";

//     /// <summary>
//     /// Creates a new ZipArchive instance.
//     /// </summary>
//     procedure CreateZipArchive()
//     begin
//         DataCompressionImpl.CreateZipArchive();
//     end;

//     /// <summary>
//     /// Creates a ZipArchive instance from the given InStream.
//     /// </summary>
//     /// <param name="InputStream">The InStream that contains the content of the compressed archive.</param>
//     /// <param name="OpenForUpdate">Indicates whether the archive should be opened in Update mode. The default (false) indicated the archive will be opened in Read mode.</param>
//     procedure OpenZipArchive(InputStream: InStream; OpenForUpdate: Boolean)
//     begin
//         DataCompressionImpl.OpenZipArchive(InputStream, OpenForUpdate);
//     end;

//     /// <summary>
//     /// Creates a ZipArchive instance from the given InStream.
//     /// </summary>
//     /// <param name="InputStream">The InStream that contains the content of the compressed archive.</param>
//     /// <param name="OpenForUpdate">Indicates whether the archive should be opened in Update mode. The default (false) indicated the archive will be opened in Read mode.</param>
//     /// <param name="EncodingCodePageNumber">Specifies the code page number of the text encoding which is used for the compressed archive entry names in the input stream.</param>
//     procedure OpenZipArchive(InputStream: InStream; OpenForUpdate: Boolean; EncodingCodePageNumber: Integer)
//     begin
//         DataCompressionImpl.OpenZipArchive(InputStream, OpenForUpdate, EncodingCodePageNumber);
//     end;

//     /// <summary>
//     /// Creates a ZipArchive instance from the given instance of Temp Blob codeunit.
//     /// </summary>
//     /// <param name="TempBlob">The instance of Temp Blob codeunit that contains the content of the compressed archive.</param>
//     /// <param name="OpenForUpdate">Indicates whether the archive should be opened in Update mode. The default (false) indicated the archive will be opened in Read mode.</param>
//     procedure OpenZipArchive(TempBlob: Codeunit "Temp Blob"; OpenForUpdate: Boolean)
//     begin
//         DataCompressionImpl.OpenZipArchive(TempBlob, OpenForUpdate);
//     end;

//     /// <summary>
//     /// Saves the ZipArchive to the given OutStream.
//     /// </summary>
//     /// <param name="OutputStream">The OutStream to which the ZipArchive is saved.</param>
//     procedure SaveZipArchive(OutputStream: OutStream)
//     begin
//         DataCompressionImpl.SaveZipArchive(OutputStream);
//     end;

//     /// <summary>
//     /// Saves the ZipArchive to the given instance of Temp Blob codeunit.
//     /// </summary>
//     /// <param name="TempBlob">The instance of the Temp Blob codeunit to which the ZipArchive is saved.</param>
//     procedure SaveZipArchive(var TempBlob: Codeunit "Temp Blob")
//     begin
//         DataCompressionImpl.SaveZipArchive(TempBlob);
//     end;

//     /// <summary>
//     /// Disposes the ZipArchive.
//     /// </summary>
//     procedure CloseZipArchive()
//     begin
//         DataCompressionImpl.CloseZipArchive();
//     end;

//     /// <summary>
//     /// Returns the list of entries for the ZipArchive.
//     /// </summary>
//     /// <param name="EntryList">The list that is populated with the list of entries of the ZipArchive instance.</param>
//     procedure GetEntryList(var EntryList: List of [Text])
//     begin
//         DataCompressionImpl.GetEntryList(EntryList);
//     end;

//     /// <summary>
//     /// Extracts an entry from the ZipArchive.
//     /// </summary>
//     /// <param name="EntryName">The name of the ZipArchive entry to be extracted.</param>
//     /// <param name="OutputStream">The OutStream to which binary content of the extracted entry is saved.</param>
//     /// <param name="EntryLength">The length of the extracted entry.</param>
//     procedure ExtractEntry(EntryName: Text; OutputStream: OutStream; var EntryLength: Integer)
//     begin
//         DataCompressionImpl.ExtractEntry(EntryName, OutputStream, EntryLength);
//     end;

//     /// <summary>
//     /// Adds an entry to the ZipArchive.
//     /// </summary>
//     /// <param name="StreamToAdd">The InStream that contains the binary content that should be added as an entry in the ZipArchive.</param>
//     /// <param name="PathInArchive">The path that the added entry should have within the ZipArchive.</param>
//     procedure AddEntry(StreamToAdd: InStream; PathInArchive: Text)
//     begin
//         DataCompressionImpl.AddEntry(StreamToAdd, PathInArchive);
//     end;


//     /// <summary>
//     /// Determines whether the given InStream is compressed with GZip.
//     /// </summary>
//     /// <param name="InStream">An InStream that contains binary content.</param>
//     /// <returns>Returns true if and only if the given InStream is compressed with GZip</returns>
//     procedure IsGZip(InStream: InStream): Boolean
//     begin
//         EXIT(DataCompressionImpl.IsGZip(InStream));
//     end;

//     /// <summary>
//     /// Compresses a stream with GZip algorithm.
//     /// <param name="InputStream">The InStream that contains the content that should be compressed.</param>
//     /// <param name="CompressedStream">The OutStream into which the compressed stream is copied to.</param>
//     /// </summary>
//     procedure GZipCompress(InputStream: InStream; CompressedStream: OutStream)
//     begin
//         DataCompressionImpl.GZipCompress(InputStream, CompressedStream);
//     end;

//     /// <summary>
//     /// Decompresses a GZipStream.
//     /// <param name="InputStream">The InStream that contains the content that should be decompressed.</param>
//     /// <param name="DecompressedStream">The OutStream into which the decompressed stream is copied to.</param>
//     /// </summary>
//     procedure GZipDecompress(InputStream: InStream; DecompressedStream: OutStream)
//     begin
//         DataCompressionImpl.GZipDecompress(InputStream, DecompressedStream);
//     end;
// }

// dotnet
// {
//     assembly("System.IO.Compression")
//     {
//         Version = '4.0.0.0';
//         Culture = 'neutral';
//         PublicKeyToken = 'b77a5c561934e089';

//         // type("System.IO.Compression.ZipArchive"; "ZipArchive")
//         // {
//         // }

//         // type("System.IO.Compression.ZipArchiveMode"; "ZipArchiveMode")
//         // {
//         // }

//         type("System.IO.Compression.ZipArchiveEntry"; "ForNavZipArchiveEntry")
//         {
//         }
//     }
// }
// // ------------------------------------------------------------------------------------------------
// // Copyright (c) Microsoft Corporation. All rights reserved.
// // Licensed under the MIT License. See License.txt in the project root for license information.
// // ------------------------------------------------------------------------------------------------

// codeunit 6188519 "Data Compression Impl."
// {
//     var
//         TempBlobZip: Codeunit "Temp Blob";
//         ZipArchive: DotNet ZipArchive;
//         ZipArchiveMode: DotNet ZipArchiveMode;
//         GZipStream: DotNet GZipStream;

//     procedure CreateZipArchive()
//     var
//         OutputStream: OutStream;
//     begin
//         Clear(TempBlobZip);
//         TempBlobZip.CreateOutStream(OutputStream);
//         ZipArchive := ZipArchive.ZipArchive(OutputStream, ZipArchiveMode.Create);
//     end;

//     procedure GZipCompress(InputStream: InStream; CompressedStream: OutStream)
//     var
//         DotNetCompressionMode: DotNet CompressionMode;
//     begin
//         GZipStream := GZipStream.GZipStream(CompressedStream, DotNetCompressionMode::Compress);
//         CopyStream(GZipStream, InputStream);
//         GZipStream.Dispose();
//     end;

//     procedure GZipDecompress(InputStream: InStream; DecompressedStream: OutStream)
//     var
//         DotNetCompressionMode: DotNet CompressionMode;
//     begin
//         GZipStream := GZipStream.GZipStream(InputStream, DotNetCompressionMode::Decompress);
//         GZipStream.CopyTo(DecompressedStream);
//         GZipStream.Dispose();
//     end;

//     procedure OpenZipArchive(InputStream: InStream; OpenForUpdate: Boolean)
//     var
//         DefaultEncoding: DotNet Encoding;
//     begin
//         DefaultEncoding := DefaultEncoding.Default();
//         OpenZipArchive(InputStream, OpenForUpdate, DefaultEncoding.CodePage());
//     end;

//     procedure OpenZipArchive(InputStream: InStream; OpenForUpdate: Boolean; EncodingCodePageNumber: Integer)
//     var
//         Encoding: DotNet Encoding;
//         Mode: DotNet ZipArchiveMode;
//         OutputStream: OutStream;
//     begin
//         Encoding := Encoding.GetEncoding(EncodingCodePageNumber);
//         Clear(TempBlobZip);
//         TempBlobZip.CreateOutStream(OutputStream);
//         CopyStream(OutputStream, InputStream);

//         if (OpenForUpdate) then
//             Mode := ZipArchiveMode.Update
//         else
//             Mode := ZipArchiveMode.Read;

//         ZipArchive := ZipArchive.ZipArchive(OutputStream, Mode, false, Encoding)
//     end;

//     procedure OpenZipArchive(TempBlob: Codeunit "Temp Blob"; OpenForUpdate: Boolean)
//     var
//         InputStream: InStream;
//     begin
//         TempBlob.CreateInStream(InputStream);
//         OpenZipArchive(InputStream, OpenForUpdate);
//     end;

//     procedure SaveZipArchive(OutputStream: OutStream)
//     var
//         InputStream: InStream;
//     begin
//         if IsNull(ZipArchive) then
//             exit;
//         ZipArchive.Dispose();
//         TempBlobZip.CreateInStream(InputStream);
//         CopyStream(OutputStream, InputStream);
//         Clear(TempBlobZip);
//     end;

//     procedure SaveZipArchive(var TempBlob: Codeunit "Temp Blob")
//     var
//         OutputStream: OutStream;
//     begin
//         if IsNull(ZipArchive) then
//             exit;
//         Clear(TempBlob);
//         TempBlob.CreateOutStream(OutputStream);
//         SaveZipArchive(OutputStream);
//     end;

//     procedure CloseZipArchive()
//     begin
//         if not IsNull(ZipArchive) then begin
//             ZipArchive.Dispose();
//             Clear(TempBlobZip);
//         end;
//     end;

//     procedure IsGZip(InStream: InStream): Boolean
//     var
//         TempBlob: Codeunit "Temp Blob";
//         TempInStream: InStream;
//         TempOutStream: OutStream;
//         ID: array[2] of Byte;
//     begin
//         TempBlob.CreateOutStream(TempOutStream);
//         CopyStream(TempOutStream, InStream);
//         TempBlob.CreateInStream(TempInStream);
//         TempInStream.Read(ID[1]);
//         TempInStream.Read(ID[2]);

//         // from GZIP file format specification version 4.3
//         // Member header and trailer
//         // ID1 (IDentification 1)
//         // ID2 (IDentification 2)
//         // These have the fixed values ID1 = 31 (0x1f, \037), ID2 = 139 (0x8b, \213), to identify the file as being in gzip format.

//         exit((ID[1] = 31) and (ID[2] = 139));
//     end;

//     procedure GetEntryList(var EntryList: List of [Text])
//     var
//         ZipArchiveEntry: DotNet ForNavZipArchiveEntry;
//         EntryFullName: Text;
//     begin
//         foreach ZipArchiveEntry in ZipArchive.Entries() do begin
//             EntryFullName := ZipArchiveEntry.FullName();
//             EntryList.Add(EntryFullName);
//         end;
//     end;

//     procedure ExtractEntry(EntryName: Text; OutputStream: OutStream; var EntryLength: Integer)
//     var
//         ZipArchiveEntry: DotNet ForNavZipArchiveEntry;
//         ZipArchiveEntryStream: DotNet Stream;
//     begin
//         ZipArchiveEntry := ZipArchive.GetEntry(EntryName);
//         ZipArchiveEntryStream := ZipArchiveEntry.Open();
//         ZipArchiveEntryStream.CopyTo(OutputStream);
//         EntryLength := ZipArchiveEntry.Length();
//         ZipArchiveEntryStream.Close();
//     end;

//     procedure AddEntry(StreamToAdd: InStream; PathInArchive: Text)
//     var
//         ZipArchiveEntry: DotNet ForNavZipArchiveEntry;
//     begin
//         ZipArchiveEntry := ZipArchive.CreateEntry(PathInArchive);
//         CopyStream(ZipArchiveEntry.Open(), StreamToAdd);
//     end;
// }
// table 6188519 "ForNAV Printer Selection"
// {
//     Caption = 'Printer Selection';
//     DataPerCompany = false;
//     LookupPageID = "Printer Selections";

//     fields
//     {
//         field(1; "User ID"; Code[50])
//         {
//             Caption = 'User ID';
//             DataClassification = EndUserIdentifiableInformation;
//             TableRelation = User."User Name";
//             //This property is currently not supported
//             //TestTableRelation = false;
//             ValidateTableRelation = false;

//             // trigger OnValidate()
//             // var
//             //     UserSelection: Codeunit "User Selection";
//             // begin
//             //     UserSelection.ValidateUserName("User ID");
//             // end;
//         }
//         field(2; "Report ID"; Integer)
//         {
//             Caption = 'Report ID';
//             TableRelation = AllObjWithCaption."Object ID" WHERE("Object Type" = CONST(Report));
//         }
//         field(3; "Printer Name"; Text[250])
//         {
//             Caption = 'Printer Name';
//             TableRelation = "ForNAV Local Printer";
//         }
//         field(4; "Report Caption"; Text[250])
//         {
//             CalcFormula = Lookup (AllObjWithCaption."Object Caption" WHERE("Object Type" = CONST(Report),
//                                                                            "Object ID" = FIELD("Report ID")));
//             Caption = 'Report Caption';
//             Editable = false;
//             FieldClass = FlowField;
//         }
//     }

//     keys
//     {
//         key(Key1; "User ID", "Report ID")
//         {
//             Clustered = true;
//         }
//     }

//     fieldgroups
//     {
//     }
// }

// page 6188519 "ForNAV Printer Selections"
// {
//     ApplicationArea = Suite;
//     Caption = 'Printer Selections';
//     PageType = List;
//     SourceTable = "ForNAV Printer Selection";
//     UsageCategory = Lists;

//     layout
//     {
//         area(content)
//         {
//             repeater(Control1)
//             {
//                 ShowCaption = false;
//                 field("User ID"; "User ID")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     LookupPageID = "User Lookup";
//                     ToolTip = 'Specifies the ID of the user for whom you want to define permissions.';
//                 }
//                 field("Report ID"; "Report ID")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     LookupPageID = Objects;
//                     ToolTip = 'Specifies the object ID of the report.';
//                 }
//                 field("Report Caption"; "Report Caption")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     DrillDown = false;
//                     ToolTip = 'Specifies the display name of the report.';
//                 }
//                 field("Printer Name"; "Printer Name")
//                 {
//                     ApplicationArea = Basic, Suite;
//                     LookupPageID = "ForNAV Local Printers";
//                     ToolTip = 'Specifies the printer that the user will be allowed to use or on which the report will be printed.';
//                 }
//             }
//         }
//         area(factboxes)
//         {
//             systempart(Control1900383207; Links)
//             {
//                 ApplicationArea = RecordLinks;
//                 Visible = false;
//             }
//             systempart(Control1905767507; Notes)
//             {
//                 ApplicationArea = Notes;
//                 Visible = false;
//             }
//         }
//     }

//     actions
//     {
//         area(Navigation)
//         {
//             action(OpenPrinterManagement)
//             {
//                 ApplicationArea = All;
//                 Caption = 'Local Printers';
//                 Image = Open;
//                 Promoted = true;
//                 PromotedCategory = Process;
//                 PromotedIsBig = true;

//                 trigger OnAction()
//                 begin
//                     Page.Run(Page::"ForNAV Local Printers");
//                 end;
//             }
//         }
//     }
// }

