<?php

namespace App\Http\Controllers;

use App\Models\Logbook;
use App\Models\Mahasiswa;
use App\Models\Mentor;
use App\Models\Upload;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use RealRashid\SweetAlert\Facades\Alert;

class UploadController extends Controller
{
    protected $logbook;
    protected $mahasiswa;
    protected $user;
    protected $mentor;
    protected $upload;
    public function __construct(Logbook $logbook, Mahasiswa $mahasiswa, User $user, Mentor $mentor, Upload $upload) {
        $this->logbook      = $logbook;
        $this->mahasiswa    = $mahasiswa;
        $this->user         = $user;
        $this->mentor       = $mentor;
        $this->upload       = $upload;
    }
    public function presentasi_final(Request $request) {
        $fun = "presentasi_final";
        if ($request->has($fun. '_submit')) {
            $this->validate($request, [
                $fun                => 'required|mimes:pdf|max:2048',
            ]);
            if ($request->hasFile($fun)) {
                $file                   = $request->file($fun);
                $fileName               = time() . '-'. $file->getClientOriginalName();
                $data                   = $request->all();
                $data['mahasiswa_id']   = Mahasiswa::where('user_id', Auth::user()->id)->get()->first()->id;
                $data[$fun]             = $fileName;
                if (Upload::where('mahasiswa_id', $data['mahasiswa_id'])->doesntExist()) {
                    if ($this->upload->post($data)) {
                        $file->move(public_path('assets/img/upload/'), $fileName);
                        Alert::success('Berhasil', $fun. ' berhasil di upload!');
                        return redirect()->back();
                    }
                } else {
                    if (Upload::where('mahasiswa_id', $data['mahasiswa_id'])->get()->first()->$fun == NULL) {
                        if ($this->upload->put(Upload::where('mahasiswa_id', $data['mahasiswa_id'])->get()->first()->id, $data)) {
                            $file->move(public_path('assets/img/upload/'), $fileName);
                            Alert::success('Berhasil', $fun. ' berhasil di upload!');
                            return redirect()->back();
                        }
                    }
                }
            }
        }
        return view('mahasiswa.upload.'.$fun,[
            'upload'    => $this->upload->show_by_id(),
            'mahasiswa' => Mahasiswa::where('user_id', Auth::User()->id)->get(),
        ]);
    }
    public function laporan_ta(Request $request) {
        $fun = "laporan_ta";
        if ($request->has($fun. '_submit')) {
            $this->validate($request, [
                $fun => 'required|mimes:pdf|max:2048',
            ]);
            if ($request->hasFile($fun)) {
                $file                   = $request->file($fun);
                $fileName               = time() . '-'. $file->getClientOriginalName();
                $data                   = $request->all();
                $data['mahasiswa_id']   = Mahasiswa::where('user_id', Auth::user()->id)->get()->first()->id;
                $data[$fun]             = $fileName;
                if (Upload::where('mahasiswa_id', $data['mahasiswa_id'])->doesntExist()) {
                    if ($this->upload->post($data)) {
                        $file->move(public_path('assets/img/upload/'), $fileName);
                        Alert::success('Berhasil', $fun. ' berhasil di upload!');
                        return redirect()->back();
                    }
                } else {
                    if (Upload::where('mahasiswa_id', $data['mahasiswa_id'])->get()->first()->$fun == NULL) {
                        if ($this->upload->put(Upload::where('mahasiswa_id', $data['mahasiswa_id'])->get()->first()->id, $data)) {
                            $file->move(public_path('assets/img/upload/'), $fileName);
                            Alert::success('Berhasil', $fun. ' berhasil di upload!');
                            return redirect()->back();
                        }
                    }
                }
            }
        }
        return view('mahasiswa.upload.'.$fun,[
            'upload'    => $this->upload->show_by_id(),
            'mahasiswa' => Mahasiswa::where('user_id', Auth::User()->id)->get(),
        ]);

    }
    public function report_a3(Request $request) {
        $fun = "report_a3";
        if ($request->has($fun. '_submit')) {
            $this->validate($request, [
                $fun => 'required|mimes:pdf|max:2048',
            ]);
            if ($request->hasFile($fun)) {
                $file                   = $request->file($fun);
                $fileName               = time() . '-'. $file->getClientOriginalName();
                $data                   = $request->all();
                $data['mahasiswa_id']   = Mahasiswa::where('user_id', Auth::user()->id)->get()->first()->id;
                $data[$fun]             = $fileName;
                if (Upload::where('mahasiswa_id', $data['mahasiswa_id'])->doesntExist()) {
                    if ($this->upload->post($data)) {
                        $file->move(public_path('assets/img/upload/'), $fileName);
                        Alert::success('Berhasil', $fun. ' berhasil di upload!');
                        return redirect()->back();
                    }
                } else {
                    if (Upload::where('mahasiswa_id', $data['mahasiswa_id'])->get()->first()->$fun == NULL) {
                        if ($this->upload->put(Upload::where('mahasiswa_id', $data['mahasiswa_id'])->get()->first()->id, $data)) {
                            $file->move(public_path('assets/img/upload/'), $fileName);
                            Alert::success('Berhasil', $fun. ' berhasil di upload!');
                            return redirect()->back();
                        }
                    }
                }
            }
        }
        return view('mahasiswa.upload.'.$fun,[
            'upload'    => $this->upload->show_by_id(),
            'mahasiswa' => Mahasiswa::where('user_id', Auth::User()->id)->get(),
        ]);

    }
    public function sertifikat(Request $request) {
        $fun = "sertifikat";
        if ($request->has($fun. '_submit')) {
            $this->validate($request, [
                'sertifikat' => 'required|mimes:pdf|max:2048',
            ]);
            if ($request->hasFile($fun)) {
                $file = $request->file($fun);
                $fileName = time() . '-'. $file->getClientOriginalName();
                $data = $request->all();
                $data['mahasiswa_id'] = Mahasiswa::where('user_id', Auth::user()->id)->get()->first()->id;
                $data[$fun] = $fileName;
                if (Upload::where('mahasiswa_id', $data['mahasiswa_id'])->doesntExist()) {
                    if ($this->upload->post($data)) {
                        $file->move(public_path('assets/img/upload/'), $fileName);
                        Alert::success('Berhasil', $fun. ' berhasil di upload!');
                        return redirect()->back();
                    }
                } else {
                    if (Upload::where('mahasiswa_id', $data['mahasiswa_id'])->get()->first()->$fun == NULL) {
                        if ($this->upload->put(Upload::where('mahasiswa_id', $data['mahasiswa_id'])->get()->first()->id, $data)) {
                            $file->move(public_path('assets/img/upload/'), $fileName);
                            Alert::success('Berhasil', $fun. ' berhasil di upload!');
                            return redirect()->back();
                        }
                    }
                }
            }
        }
        return view('mahasiswa.upload.'.$fun,[
            'upload'    => $this->upload->show_by_id(),
            'mahasiswa' => Mahasiswa::where('user_id', Auth::User()->id)->get(),
        ]);
    }

    public function pptFinal()
    {
        $title = 'PPT Final';
        $data = $this->upload->dataUpload();
        $batch = $this->mahasiswa->Batch();
        return view('report.ppt-final', compact('title', 'data', 'batch'));
    }
    public function postPptFinal(Request $request)
    {
        $title = 'PPT Final';
        $data = $this->upload->postData($request->batch);
        $batch = $this->mahasiswa->Batch();
        return view('report.ppt-final', compact('title', 'data', 'batch'));
    }
    public function laporantugasAkhir()
    {
        $title = 'Laporan TA';
        $data = $this->upload->dataUpload();
        $batch = $this->mahasiswa->Batch();
        return view('report.laporan-tugas-akhir', compact('title', 'data', 'batch'));
    }
    public function postLaporantugasAkhir(Request $request)
    {
        $title = 'Laporan TA';
        $data = $this->upload->postData($request->batch);
        $batch = $this->mahasiswa->Batch();
        return view('report.laporan-tugas-akhir', compact('title', 'data', 'batch'));
    }
    public function aTigaReport()
    {
        $title = 'Laporan TA';
        $data = $this->upload->dataUpload();
        $batch = $this->mahasiswa->Batch();
        return view('report.a3report', compact('title', 'data', 'batch'));
    }
    public function postATigaReport(Request $request)
    {
        $title = 'Laporan TA';
        $data = $this->upload->postData($request->batch);
        $batch = $this->mahasiswa->Batch();
        return view('report.a3report', compact('title', 'data', 'batch'));
    }
    public function sertifikatMahasiswa()
    {
        $title = 'Laporan TA';
        $data = $this->upload->dataUpload();
        $batch = $this->mahasiswa->Batch();
        return view('report.sertifikat', compact('title', 'data', 'batch'));
    }
    public function postSertifikatMahasiswa(Request $request)
    {
        $title = 'Laporan TA';
        $data = $this->upload->postData($request->batch);
        $batch = $this->mahasiswa->Batch();
        return view('report.sertifikat', compact('title', 'data', 'batch'));
    }
    public function pptFinalDosen()
    {
        $title = 'PPT Final';
        $data = $this->upload->dataUploadDosen();
        $batch = $this->mahasiswa->Batch();
        return view('report.ppt-final', compact('title', 'data', 'batch'));
    }
    public function postPptFinalDosen(Request $request)
    {
        $title = 'PPT Final';
        $data = $this->upload->postDataDosen($request->batch);
        $batch = $this->mahasiswa->Batch();
        return view('report.ppt-final', compact('title', 'data', 'batch'));
    }
    public function laporantugasAkhirDosen()
    {
        $title = 'Laporan TA';
        $data = $this->upload->dataUploadDosen();
        $batch = $this->mahasiswa->Batch();
        return view('report.laporan-tugas-akhir', compact('title', 'data', 'batch'));
    }
    public function postLaporantugasAkhirDosen(Request $request)
    {
        $title = 'Laporan TA';
        $data = $this->upload->postDataDosen($request->batch);
        $batch = $this->mahasiswa->Batch();
        return view('report.laporan-tugas-akhir', compact('title', 'data', 'batch'));
    }
    public function aTigaReportDosen()
    {
        $title = 'Laporan TA';
        $data = $this->upload->dataUploadDosen();
        $batch = $this->mahasiswa->Batch();
        return view('report.a3report', compact('title', 'data', 'batch'));
    }
    public function postATigaReportDosen(Request $request)
    {
        $title = 'Laporan TA';
        $data = $this->upload->postDataDosen($request->batch);
        $batch = $this->mahasiswa->Batch();
        return view('report.a3report', compact('title', 'data', 'batch'));
    }
    public function sertifikatMahasiswaDosen()
    {
        $title = 'Laporan TA';
        $data = $this->upload->dataUploadDosen();
        $batch = $this->mahasiswa->Batch();
        return view('report.sertifikat', compact('title', 'data', 'batch'));
    }
    public function postSertifikatMahasiswaDosen(Request $request)
    {
        $title = 'Laporan TA';
        $data = $this->upload->postDataDosen($request->batch);
        $batch = $this->mahasiswa->Batch();
        return view('report.sertifikat', compact('title', 'data', 'batch'));
    }
}
