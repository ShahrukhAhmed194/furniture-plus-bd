@extends('front.layouts.master')

@section('head')
    @include('meta::manager', [
        'title' => 'All Hot Deals - ' . ($settings_g['title'] ?? env('APP_NAME')),
    ])
@endsection
@php
    $template = 0;
    if(isset($settings_g['template'])) $template = $settings_g['template'];
@endphp
@section('master')
<div class="{{ $container }}">
    @include('front.layouts.breadcrumb', [
        'title' => 'All Hot Deals',
        'url' => '#'
    ])
        @if($template == 2)
            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 mb-6">
                @foreach ($products as $product)
                    @include('front.template2.product-loop')
                @endforeach
            </div>
        @elseif($template == 3)
            <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-5 mb-6">
                @foreach ($products as $product)
                    @include('front.template3.product-loop')
                @endforeach
            </div>
        @else
            <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 mb-6">
                @foreach ($products as $product)
                    @include('front.layouts.product-loop')
                @endforeach
            </div>
        @endif

    <div class="my-6 mb-8">
        {{$products->links('pagination::tailwind')}}
    </div>
</div>
@endsection
