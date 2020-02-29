import { Injectable } from '@angular/core';
import 'rxjs/Rx';
import { URLConstants } from '../constants/urlconstants';
import { HttpClient, HttpParams } from '@angular/common/http';
import { CRMConstants } from '../constants/crmconstants';
import { CommonService } from './common.service';
import { IfObservable } from 'rxjs/observable/IfObservable';

@Injectable()
export class HttpService {
    constructor(private http: HttpClient, private commonService: CommonService) {
    }

    get(url, options?) {
        var result = this.commonService.checkAndUpdateLoginTime();
        if (result == false)
            return;
        return this.http.get(url, options)
            .map(res => res)
            .retry(1)
            .catch(this.handleError);
    }

    getReport(url, options?) {
        return this.http.get(url, options)
            .map(res => res)
            .retry(1)
            .catch(this.handleError);
    }

    post(url, data, options?) {
        var result = this.commonService.checkAndUpdateLoginTime();
        if (result == false)
            return;
        return this.http.post(url, data, options)
            .map(res => res)
            .catch(this.handleError);
    }

    put(url, data, options?) {
        var result = this.commonService.checkAndUpdateLoginTime();
        if (result == false)
            return;
        return this.http.put(url, data, options)
            .map(res => res)
            .catch(this.handleError);
    }
    delete(url, options?) {
        var result = this.commonService.checkAndUpdateLoginTime();
        if (result == false)
            return;
        return this.http.delete(url, options)
            .map(res => res)
            .retry(1)
            .catch(this.handleError);
    }

    private handleError(error: any) {
        return IfObservable.throw(error);
    }
}
