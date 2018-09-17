import { Injectable } from '@angular/core';

import { URLConstants } from '../constants/urlconstants';
import { HttpClient } from '@angular/common/http';

@Injectable()
export class ImportService {

  constructor(private http: HttpClient) { }
  importDocuments(frmData:FormData) {
    return this.http.post<any>(URLConstants.IMPORT_DOC_URL, frmData)
        .map(success => {
            
            return success;
        });
  }
 
}