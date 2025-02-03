@extends('front.layouts.master')

@section('head')
@include('meta::manager', [
    'title' => $page->title.'- ' . ($settings_g['title'] ?? ''),
])
@endsection
@php
    $template = 0;
    if(isset($settings_g['template'])) $template = $settings_g['template'];
@endphp
@section('master')
<div class="bg-gray-100">
    <div class="pt-4">
        <div class="{{ $container }} mt-5 pb-4 md:pb-16 max-w-[1224px]">
            @include('front.layouts.breadcrumb', [
                'title' => $page->title,
                'url' => '#'
            ])
            <div class="card mb-4">
                <div class="card-body">
                    @if($page->media_id)
                        <img src="{{ $page->img_paths['small'] }}" class="img-thumbnail float-left rounded mr-2" alt="{{ $page->name }}">
                    @endif
                    <div class="text-justify">{!! $page->description !!}</div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section('footer')

@endsection
