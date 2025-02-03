@extends('front.layouts.master')

@section('head')
@include('meta::manager', [
    'title' => 'Search Product - ' . ($settings_g['title'] ?? ''),
])
@endsection
@php
    $template = 0;
    if(isset($settings_g['template'])) $template = $settings_g['template'];
@endphp
@section('master')
    <div class="{{ $container }}">
        @include('front.layouts.breadcrumb', [
            'title' => 'Search result for "' . $search . '"',
            'url' => '#'
        ])

        @if(count($products))
            @if($template == 2)
                <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 mb-6 gap-2 md:gap-6">
                    @foreach ($products as $product)
                        @include('front.template2.product-loop')
                    @endforeach
                </div>
            @elseif($template == 3)
                <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-5 mb-6 gap-2 md:gap-6">
                    @foreach ($products as $product)
                        @include('front.template3.product-loop')
                    @endforeach
                </div>
            @else
                <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 mb-6 gap-6 text-center">
                    @foreach ($products as $product)
                        @include('front.layouts.product-loop')
                    @endforeach
                </div>
            @endif

            <div class="my-6 mb-8">
                {{$products->appends(Request::except('page'))->links('pagination::tailwind')}}
            </div>
        @else
            <div class="text-center py-40">
                <p class="text-red-600 font-bold text-3xl mb-5">Sorry! No Product Found!</p>

                <a href="{{route('homepage')}}" class="text-center rounded-md border-2 border-primary bg-primary px-6 py-2 text-base font-medium text-font-color-light shadow-sm hover:bg-white hover:text-primary text-white">Home</a>
            </div>
        @endif
    </div>
@endsection
