import {Component} from '@angular/core';
import {CodexDataModel} from '../../../models/codexDataModel';
import {CodexDataApiService} from '../../../services/api/codexDataApi.service';
import { CodexBaseDataLookupService } from '../../../services/codexBaseDataLookupService';
import { AuthenticationService } from '../../../services/api/authentication.service';
import {BaseDataComponent} from '../baseData.component';

@Component({
	selector: 'app-codex',
	templateUrl: './codexData.component.html',
	styleUrls: ['./codexData.component.less']
})
export class CodexDataComponent extends BaseDataComponent<CodexDataModel> {

	constructor(
		api: CodexDataApiService,
		auth: AuthenticationService,
		public baseData: CodexBaseDataLookupService) {
		super(api, auth);
	}

	public getNewDto() {
		return new CodexDataModel(0);
	}

	public delete(entry: CodexDataModel) {
		if (entry && window.confirm(`Really delete codex data entry ${this.baseData.codexCategoryLookup[entry.categoryId].name} ${entry.entryNumber}?`)) {
			this.api.delete(entry.id)
				.do(() => this.loadData())
				.subscribe();
		}
	}
}
