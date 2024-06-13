<?php

namespace App\Http\Controllers;

use App\Models\Section;
use App\Models\User;
use Illuminate\Http\Request;
use Validator;

class SectionController extends Controller
{
    protected $section;
    protected $user;
    public function __construct(Section $section, User $user)
    {
        $this->section = $section;
        $this->user = $user;
    }
    public function section()
    {
        $title = 'Section';
        $data = $this->section->Tampil();
        return view('admin.section.index', compact('title', 'data'));
    }
    public function add_section(Request $request)
    {
        $val = Validator::make($request->all(), [
            'section' => 'required'
        ], [
            'section.required' => 'Section Tidak Boleh Kosong'
        ]);
        if ($val->fails()) {
            return redirect()->back()->withErrors($val);
        }
        $this->section->Post([
            'section' => $request->section
        ]);
        return redirect()->back()->with('create', 'Data Berhasil Ditambah');
    }
    public function edit_section($id, Request $request)
    {
        $user_id = $request->user_id;
        $this->user->Ubah($user_id, [
            'nama' => $request->nama
        ]);
        $this->section->Ubah($id, [
            'section' => $request->section
        ]);
        return redirect('admin/section')->with('update', 'Data Berhasil Diubah');
    }
    public function delete_section($id)
    {
        $this->section->Hapus($id);
        return redirect('admin/section')->with('delete', 'Data Berhasil Dihapus');
    }
    public function detail_section($id){
        $title = 'Section';
        return view('admin.section.detail',compact('title'));
    }
}
