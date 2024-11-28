import { TestBed } from '@angular/core/testing';

import { CicloEstudiantilService } from './cicloestudiantil.service';

describe('CicloEstudiantilService', () => {
  let service: CicloEstudiantilService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(CicloEstudiantilService);
  });
  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
