import { Injectable } from '@angular/core';

import { URLConstants } from '../constants/urlconstants';
import { HttpService } from './http.service';

@Injectable()
export class ImportService {

  constructor(private http: HttpService) { }
  importDocuments(frmData:FormData) {
    return this.http.post(URLConstants.IMPORT_DOC_URL, frmData)
        .map(success => {
            
            return success;
        });
  }
 
}
