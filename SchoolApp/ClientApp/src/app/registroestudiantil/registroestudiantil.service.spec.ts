import { TestBed } from '@angular/core/testing';

import { RegistroEstudiantilService } from './registroestudiantil.service';

describe('CicloEstudiantilService', () => {
  let service: RegistroEstudiantilService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(RegistroEstudiantilService);
  });
  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
