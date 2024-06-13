@extends('template.app')
@section('mentor','active open')
@section('logbook','active')
@if ($mentor->isEmpty())
<script type="text/javascript">
    window.location.href = "{{ route('profile.mentor') }}";
</script>
@else
@section('content')
        <div class="card w-100 shadow p-3 mb-5 rounded border" >
            <div class="card-body">
                <div class="row">
                    <div class="col-6 col-md-8">
                        <h5 class="card-title">Leader : {{ $mentor->first()->leader }}</h5>
                    </div>
                    <div class="col-6 col-md-4">
                        <div class="d-flex justify-content-end">
                            @if (!$logbook->isEmpty())
                            <a href="{{ route('logbook.mentor.print') }}" class="btn btn-secondary"><i class="bx bx-printer"></i></a>
                            @endif
                        </div>
                    </div>
                </div>
                @if ($errors->any())
                    <div class="alert alert-danger mt-3">
                        @foreach ($errors->all() as $error)
                            <p>{{ $error }}</p>
                        @endforeach
                    </div>
                @endif
                {{-- edit modal --}}
                @foreach ($logbook as $data)
                <div class="modal fade" id="ModalTinjau{{ $data->id }}" tabindex="-1"
                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Edit Data Logbook Mahasiswa</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <form action="{{ route('logbook.mentor.tinjau', ['id' => $data->id]) }}" method="POST" enctype="multipart/form-data">
                                @csrf
                                @method('PUT')
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label for="exampleFormControlInput1" class="form-label">Nama Mahasiswa</label>
                                                <input type="text" value="{{ $data->mahasiswa->user->nama }}" class="form-control" required disabled placeholder="Masukan Shop">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label for="exampleFormControlTextarea1" class="form-label">Nomor Induk</label>
                                                <input type="text" value="{{ $data->mahasiswa->user->nomor_induk }}" class="form-control" disabled placeholder="Masukan line"></input>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label for="exampleFormControlTextarea1" class="form-label">Line/Proses</label>
                                                <input type="text" value="{{ $data->mahasiswa->line }}" class="form-control" disabled placeholder="Masukan line"></input>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label for="exampleFormControlTextarea1" class="form-label">Shop</label>
                                                <input type="text" value="{{ $data->mahasiswa->shop }}" class="form-control" disabled placeholder="Masukan line"></input>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label for="exampleFormControlTextarea1"
                                                    class="form-label">Keterangan</label>
                                                <textarea type="text" disabled class="form-control" style="resize: none" required>{{ $data->keterangan }}</textarea>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label for="exampleFormControlTextarea1" class="form-label">Gambar</label>
                                                {{-- @dd(asset('assets/img/logbok/'.$data->gambar)) --}}
                                                <br>
                                                <img src="{{ asset('assets/img/logbook/'.$data->gambar) }}" width="25%">
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label for="exampleFormControlTextarea1" class="form-label">Tools Used</label>
                                                <input type="text" name="tool_used" value="{{ $data->tool_used }}" class="form-control" required placeholder="Masukan Tool Used"></input>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label for="exampleFormControlTextarea1" class="form-label">Safety</label>
                                                <input type="text" name="safety_key_point" value="{{ $data->safety_key_point }}" class="form-control" required placeholder="Masukan Tool Safety"></input>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label for="exampleFormControlTextarea1" class="form-label">Problem Solf / Kaizen Point</label>
                                                <input type="text" name="problem_solf" value="{{ $data->problem_solf }}" class="form-control" required placeholder="Problem Solf / Kaizen Point"></input>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label for="exampleFormControlTextarea1" class="form-label">Hyarihatto</label>
                                                <input type="text" name="hyarihatto" value="{{ $data->hyarihatto }}" class="form-control" required placeholder="Masukan Hyarihatto"></input>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Mentor Eveluation</label>
                                                <select class="form-control" name="mentor_eveluation" id="">
                                                    <option value=""> == Pilih Salah Satu ==</option>
                                                    <option value="1" {{ $data->mentor_eveluation == '1' ? 'selected' : '' }}>1 - Poor</option>
                                                    <option value="2" {{ $data->mentor_eveluation == '2' ? 'selected' : '' }}>2 - Enough</option>
                                                    <option value="3" {{ $data->mentor_eveluation == '3' ? 'selected' : '' }}>3 - Good</option>
                                                    <option value="4" {{ $data->mentor_eveluation == '4' ? 'selected' : '' }}>4 - Excellent</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label for="exampleFormControlTextarea1" class="form-label">Point To Remember</label>
                                                <textarea name="point_to_remember" class="form-control" required>{{ $data->point_to_remember }}</textarea>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label for="exampleFormControlTextarea1" class="form-label">Komentar Mentor</label>
                                                <textarea name="komentar_mentor" class="form-control" required>{{ $data->komentar_mentor }}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                @endforeach
                {{-- end modal --}}
                <div class="table-responsive mt-5">
                    <table id="example" class="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Nama Mahasiswa</th>
                                <th>Nomor induk</th>
                                <th>Shop</th>
                                <th>Line/Proses</th>
                                <th>Week</th>
                                <th>Mounth</th>
                                <th>Dibuat</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                            $no = 1;
                            @endphp
                            @foreach ($logbook as $data)
                                {{-- Tambah modal --}}
                                <div class="modal fade" id="ModalEdit{{ $data->id }}" tabindex="-1"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-xl">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Tinjau Data Logbook</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <form action="{{ route('logbook.mentor.tinjau', ['id' => $data->id]) }}" method="POST" enctype="multipart/form-data">
                                                @csrf
                                                @method('PUT')
                                                <div class="modal-body">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label for="exampleFormControlInput1" class="form-label">Nama Mahasiswa</label>
                                                                <input type="text" value="{{ $data->mahasiswa->user->nama }}" class="form-control" required disabled placeholder="Masukan Shop">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label for="exampleFormControlTextarea1" class="form-label">Nomor Induk</label>
                                                                <input type="text" value="{{ $data->mahasiswa->user->nomor_induk }}" class="form-control" disabled placeholder="Masukan line"></input>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label for="exampleFormControlTextarea1" class="form-label">Line/Proses</label>
                                                                <input type="text" value="{{ $data->mahasiswa->line }}" class="form-control" disabled placeholder="Masukan line"></input>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="mb-3">
                                                                <label for="exampleFormControlTextarea1" class="form-label">Shop</label>
                                                                <input type="text" value="{{ $data->mahasiswa->shop }}" class="form-control" disabled placeholder="Masukan line"></input>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="mb-3">
                                                                <label for="exampleFormControlTextarea1"
                                                                    class="form-label">Keterangan</label>
                                                                <textarea type="text" disabled class="form-control" style="resize: none" required>{{ $data->keterangan }}</textarea>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="mb-3">
                                                                <label for="exampleFormControlTextarea1" class="form-label">Gambar</label>
                                                                <br>
                                                                @if ($data->gambar)
                                                                <img src="{{ asset('assets/img/logbook/'.$data->gambar) }}" width="25%">
                                                                @else
                                                                <span class="badge bg-primary">Data gambar tidak ada</span>
                                                                @endif
                                                            </div>
                                                        </div>
                                                        <hr>
                                                        <div class="col-md-12">
                                                            <div class="mb-3">
                                                                <label for="exampleFormControlTextarea1" class="form-label">Tools Used</label>
                                                                <input type="text" name="tool_used" value="{{ old('tool_used') }}" class="form-control" required placeholder="Masukan Tool Used"></input>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="mb-3">
                                                                <label for="exampleFormControlTextarea1" class="form-label">Safety</label>
                                                                <input type="text" name="safety_key_point" value="{{ old('safety_key_point') }}" class="form-control" required placeholder="Masukan Tool Safety"></input>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="mb-3">
                                                                <label for="exampleFormControlTextarea1" class="form-label">Problem Solf / Kaizen Point</label>
                                                                <input type="text" name="problem_solf" value="{{ old('problem_solf') }}" class="form-control" required placeholder="Problem Solf / Kaizen Point"></input>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="mb-3">
                                                                <label for="exampleFormControlTextarea1" class="form-label">Hyarihatto</label>
                                                                <input type="text" name="hyarihatto" value="{{ old('hyarihatto') }}" class="form-control" required placeholder="Masukan Hyarihatto"></input>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="mb-3">
                                                                <label class="form-label">Mentor Eveluation</label>
                                                                <select class="form-control" name="mentor_eveluation" id="">
                                                                    <option selected disabled> == Pilih Salah Satu ==</option>
                                                                    <option value="1">1 - Poor</option>
                                                                    <option value="2">2 - Enough</option>
                                                                    <option value="3">3 - Good</option>
                                                                    <option value="4">4 - Exelent</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="mb-3">
                                                                <label for="exampleFormControlTextarea1" class="form-label">Point To Remember</label>
                                                                <textarea name="point_to_remember" class="form-control" required>{{ old('point_to_remember') }}</textarea>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="mb-3">
                                                                <label for="exampleFormControlTextarea1" class="form-label">Komentar Mentor</label>
                                                                <textarea name="komentar_mentor" class="form-control" required>{{ old('komentar_mentor') }}</textarea>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-12">
                                                            <div class="mb-3 row">
                                                                <label for="exampleFormControlTextarea1" class="col-sm-12 col-form-label">Paraf Mentor</label>
                                                                <div class="col-sm-12">
                                                                    @if ($paraf->isEmpty() == true)
                                                                        <img src="{{ asset('assets/img/paraf/') }}" class="img-fluid rounded mb-3" style="width: 30%" alt="">
                                                                    @else
                                                                        <img src="{{ asset('assets/img/paraf/'. $paraf->value('ttd')) }}" class="img-fluid rounded mb-3" style="width: 30%" alt="">
                                                                    @endif
                                                                </div>
                                                                <div class="col-sm-12">
                                                                    <input type="file" name="paraf" class="form-control" style="resize: none" accept="image/png" {{ $paraf->isEmpty() == true  ? 'required' : ''}}>
                                                                    <span style="color: red">{{ $paraf->isEmpty() == true  ? 'Silahkan Upload scan paraf dengan format .png' : '*Abaikan jika paraf sudah terdapat pada database.'}}</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    <button type="submit" name="tambah" class="btn btn-primary">Save</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                {{-- end modal --}}
                                <tr>
                                    <td>{{ $no++ }}</td>
                                    <td>{{ $data->mahasiswa->user->nama }}</td>
                                    <td>{{ $data->mahasiswa->user->nomor_induk }}</td>
                                    <td>{{ $data->mahasiswa->shop }}</td>
                                    <td>{{ $data->mahasiswa->line }}</td>
                                    <td>{{ $data->week }}</td>
                                    <td>{{ $data->mounth }}</td>
                                    <td>{{ $data->created_at }}</td>
                                    <td>
                                        <span class="badge rounded-pill <?php echo $data->status == 'accept' ? 'bg-success' : ($data->status == 'pending' ? 'bg-primary' : 'bg-danger'); ?>">
                                            {{ $data->status }}
                                        </span>
                                    </td>
                                    <td class="d-flex flex-column flex-sm-row">
                                        @if ($data->status == 'pending')
                                        <button data-bs-toggle="modal" data-bs-target="#ModalEdit{{ $data->id }}" class="btn btn-primary btn-sm mb-2 mb-sm-0 me-sm-2 bx bx-file"></button>
                                        <a href="{{ route('logbook.mentor.reject', $data->id) }}" class="btn btn-danger btn-sm mb-2 mb-sm-0 me-sm-2 bx bx-error-circle" data-confirm-delete="true"></a>
                                        @elseif ($data->status == 'accept')
                                            <button data-bs-toggle="modal" data-bs-target="#ModalTinjau{{ $data->id }}" class="btn btn-warning btn-sm mb-2 mb-sm-0 me-sm-2 bx bx-show-alt"></button>
                                            <a href="{{ route('logbook.mentor.reject', ['id' => $data->id]) }}" class="btn btn-danger btn-sm mb-2 mb-sm-0 me-sm-2 bx bx-error-circle" data-confirm-delete="true"></a>
                                        @elseif ($data->status == 'reject')
                                            <button data-bs-toggle="modal" data-bs-target="#ModalEdit{{ $data->id }}" class="btn btn-warning btn-sm mb-2 mb-sm-0 me-sm-2 bx bx-show-alt"></button>
                                        @endif
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    @endsection
@endif
