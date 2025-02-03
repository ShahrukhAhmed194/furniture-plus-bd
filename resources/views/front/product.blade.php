@extends('front.layouts.master')
@section('head')
    @include('meta::manager', [
        'title' => $product->title . ' - ' . ($settings_g['title'] ?? env('APP_NAME')),
        'image' => $product->img_paths['medium'],
        'description' => $product->meta_description,
        'keywords' => $product->meta_tags
    ])

    <link href="{{asset('front/magiczoomplus.css')}}?c=1" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="{{asset('front/OwlCarousel/dist/assets/owl.carousel.min.css')}}">
    <link rel="stylesheet" href="{{asset('front/OwlCarousel/dist/assets/owl.theme.default.min.css')}}">
    <style>
        /* Ensure the content is responsive */
        .content {
            max-width: 100%;
            word-wrap: break-word;
        }
        
        /* Responsive video embeds */
        .content iframe, .content video {
            width: 100%; /* Video takes full width of the container */
            height: auto; /* Keeps the aspect ratio */
            max-width: 100%; /* Ensures videos don't overflow */
        }
        
        /* Video wrapper for aspect ratio */
        .video-wrapper {
            position: relative;
            padding-bottom: 56.25%; /* 16:9 aspect ratio (adjust as needed) */
            height: 0;
            overflow: hidden;
        }
        
        .video-wrapper iframe, .video-wrapper video {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }
        
        /* Text adjustments for readability */
        @media (max-width: 768px) {
            .content {
                font-size: 14px; /* Slightly smaller font on smaller screens */
                padding: 10px; /* Add some padding for mobile readability */
            }
        }
        
        @media (min-width: 769px) {
            .content {
                font-size: 16px;
                padding: 20px;
            }
        }

    </style>
@endsection
@php
    $template = 0;
    if(isset($settings_g['template'])) $template = $settings_g['template'];
@endphp
@section('master')
<div class="{{ $container }}">
    @include('front.layouts.breadcrumb', [
        'title' => $product->title,
        'url' => $product->route
    ])
     @if($template ==3)
        <div>
            <div class="grid grid-cols-1 lg:grid-cols-2 md:gap-5 gap-2">
                <div class="flex items-center justify-center">
                    <div class="flex flex-col gap-3">
                        <div class="border flex items-center justify-center rounded-lg overflow-hidden real">
                            <img id="product_preview2" src="{{$product->img_paths['original']}}" class="w-full h-auto object-center shadow-md  hover:scale-150 transition-all duration-500" width="300" height="160" alt="{{ $product->title }}"/>
                        </div>
                        <div class="flex gap-3 items-center justify-start">
                            <img src="{{$product->img_paths['small']}}" class="w-[100px] md:w-[100px] border rounded-lg cursor-pointer hover:opacity-70 transition-all" onclick="changeProductImage2('{{$product->img_paths['original']}}');" alt="{{ $product->title }}"/>
                            @foreach ($product->Gallery as $gallery)
                                <img src="{{$gallery->paths['small']}}" onclick="changeProductImage2('{{$gallery->paths['original']}}');" class="w-[100px] md:w-[100px] border rounded-lg cursor-pointer hover:opacity-70 transition-all" alt="{{ $product->title }}"/>
                            @endforeach
                        </div>
                    </div>
                </div>
                <div>
                    <div class="flex flex-col gap-3 text-wrap">
                        @foreach($product->Categories->splice(0,1) as $cat)
                            {{$cat->title}}
                        @endforeach
                        <h2 class="text-xl md:text-2xl font-semibold">{{ $product->title }}</h2>
                        <div>
                            @if($product->type && $product->type=="Variable" && count($product->VariableProductData))
                                <input type="hidden" value="{{ $product->VariableProductData[0]['unit_amount']??1 }}" id="unit_default_val">
                                <span class="text-teal-600 font-semibold text-sm md:text-lg mx-0">
                                <span><span class="unit_show">{{ $product->VariableProductData[0]['unit_amount']??1 }}</span></span>
                                </span>
                                <span class="text-gray-600 text-sm">{{ $product->VariableProductData[0]['unit']??'Pcs' }}</span>
                            @else
                                <input type="hidden" value="{{ $product->productData['unit_amount']??1 }}" id="unit_default_val">
                                <span class="text-teal-600 font-semibold text-sm md:text-lg mx-0">
                                <span><span class="unit_show">{{ $product->productData['unit_amount']??1 }}</span></span>
                                </span>
                                <span class="text-gray-600 text-sm">{{ $product->productData['unit']??'Pcs' }}</span>
                            @endif
                       </div>
                        <div class="flex items-end gap-2">
                            <input type="hidden" id="price_value" value="{{ $product->prices['sale_price'] }}">
                            <h5 class="text-2xl font-semibold">{{ $settings_g['currency_symbol'] ?? '৳' }}<span class="price_show single_product_price">{{$product->prices['sale_price']}}</span> </h5>
                            @if($product->prices['regular_price'] > 0 && $product->prices['regular_price'] > $product->prices['sale_price'])
                                <span class="text-neutral-500 line-through">/{{ $settings_g['currency_symbol'] ?? '৳' }}<span class="price_show2">{{ $product->prices['regular_price'] }}</span></span>
                            @endif
                        </div>
                        <div class="sp_variation mb-8">
                            @foreach ($product->VariableAttributes as $key=>$attribute)
                                <div><span class="mr-2 mt-2 d-inline-block"><b>{{$attribute->name}}:</b></span></div>

                                <ul class="sp_variation_all npnls overflow-hidden">
                                    @foreach ($attribute->AttributeItems as $key2=>$attribute_item)
                                        @if(in_array($attribute_item->id, $product->attribute_items_arr))
                                            <li>
                                                <input type="radio" name="attr_id_{{$attribute->id}}" {{ $key == $key?'checked':'' }} id="av_id_{{$attribute_item->id}}" class="co_radio" value="{{$attribute->id . ':' . $attribute_item->id}}">
                                                <label for="av_id_{{$attribute_item->id}}" class="cartOptions">{{$attribute_item->name}}</label>
                                            </li>
                                        @endif
                                    @endforeach
                                </ul>
                            @endforeach
                        </div>
                        @if($product->total_review >0)
                            <div>
                                <span class="text-lg"> {{ $product->average_rating }}</span>
                                <span class="text-orange-400 text-sm">({{ $product->total_review }} reviews)</span>
                            </div>
                        @endif

                        <form method="get" action="{{route('cart.directOrder')}}">
                            @csrf
                            <input type="hidden" name="product" value="{{ $product->id }}">
                            @if($product->type && $product->type=="Variable" && count($product->VariableProductData))
                                <input type="hidden" class="product_data_id" name="product_data_id" value="{{ $product->VariableProductData[0]['id'] }}">
                            @endif
                            <div class="relative flex items-center max-w-[8rem]">
                                <button type="button" id="decrement-button" onclick="inputChangeEv(0)" data-input-counter-decrement="quantity-input" class="bg-gray-100 hover:bg-gray-200 border border-gray-300 rounded-s-lg p-3 h-11 focus:ring-gray-100 dark:focus:ring-gray-700 focus:ring-2 focus:outline-none">
                                    <svg class="w-3 h-3 text-gray-900" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 2">
                                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 1h16"/>
                                    </svg>
                                </button>
                                <input type="text" name="quantity" id="quantity-input" data-input-counter data-input-counter-min="1" data-input-counter-max="50" aria-describedby="helper-text-explanation" class="single_cart_quantity bg-gray-50 border-x-0 border-gray-300 h-11 text-center text-gray-900 text-sm focus:ring-blue-500 focus:border-blue-500 block w-full py-2.5" placeholder="999" value="1" readonly required/>
                                <button type="button" id="increment-button" onclick="inputChangeEv(1)" data-input-counter-increment="quantity-input" class="bg-gray-100 hover:bg-gray-200 border border-gray-300 rounded-e-lg p-3 h-11 focus:ring-gray-100 dark:focus:ring-gray-700 focus:ring-2 focus:outline-none">
                                    <svg class="w-3 h-3 text-gray-900" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18">
                                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 1v16M1 9h16"/>
                                    </svg>
                                </button>
                            </div>
                            <div class="flex items-center gap-1 md:gap-3 mt-5 justify-center md:justify-start">
                                <button type="submit" class="box-border inline-flex items-center justify-center w-auto px-8 py-3 overflow-hidden font-bold text-white transition-all duration-300 bg-green-600 hover:bg-green-700 rounded-full cursor-pointer group ring-offset-2 ring-1 ring-green-600 ring-offset-green-600 hover:ring-offset-green-600 ease focus:outline-none">
                                    <span>Buy Now</span>
                                </button>

                                <button type="button" onclick="addToCart2('{{$product->id}}')" class="rounded-full px-3.5 py-2 m-1 overflow-hidden relative group cursor-pointer border-2 font-medium border-green-600 text-indigo-600 flex items-center hover:bg-green-600 hover:text-white justify-center gap-2">
                                    <span class="absolute w-64 h-0 transition-all duration-300 origin-center rotate-45 -translate-x-20 top-1/2 group-hover:h-64 group-hover:-translate-y-32 ease"></span>
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6 relative transition-all">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 10.5V6a3.75 3.75 0 1 0-7.5 0v4.5m11.356-1.993 1.263 12c.07.665-.45 1.243-1.119 1.243H4.25a1.125 1.125 0 0 1-1.12-1.243l1.264-12A1.125 1.125 0 0 1 5.513 7.5h12.974c.576 0 1.059.435 1.119 1.007ZM8.625 10.5a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Zm7.5 0a.375.375 0 1 1-.75 0 .375.375 0 0 1 .75 0Z" />
                                    </svg>
                                    <span class="relative text-indigo-600 transition group-hover:text-white duration-300 ease mt-1">Add to Bag</span>
                                </button>
                            </div>
                        </form>
                        <div class="flex items-center flex-col md:flex-row gap-3 mt-5">
                            <div class="flex items-center justify-center gap-3 px-3 rounded">
                                <div>
                                    <img src="https://cdn-icons-png.flaticon.com/512/66/66841.png" alt="delivery icon" loading="lazy" class="w-12">
                                </div>
                                <div>
                                    <p class="text-xl">Fast Delivery</p>
                                </div>
                            </div>
                            <div class="flex items-center justify-center gap-3 px-3 rounded">
                                <div>
                                    <img src="https://media.istockphoto.com/id/1360644683/vector/24-hour-icon-rotating-arrow-vector.jpg?s=612x612&w=0&k=20&c=frnqCBtIDuBFwRUyp0BcYQlOIStT7voGzpL6KbIvm0I=" alt="delivery icon" loading="lazy" class="w-12">
                                </div>
                                <div>
                                    <p class="text-xl">24/7 Customer Service</p>
                                </div>
                            </div>
                        </div>

                        <div class="mt-5 flex items-center">
                            <a href="https://api.whatsapp.com/send?phone={{ $settings_g['whatsapp_number'] }}&amp;text={{ Request::url() }}&amp;" class="flex items-center gap-2 text-lg font-bold border px-3 py-1 rounded-lg transition-all hover:shadow-lg">
                                <img src="https://pngimg.com/d/whatsapp_PNG21.png" alt="whatsapp" class="w-[30px]">
                                <span class="text-sm">WhatsApp</span>
                            </a>
                        </div>
                    </div>
                </div>

            </div>

            <div class="mb-4 border-b border-gray-200 dark:border-gray-700">
                <ul class="flex flex-wrap -mb-px text-sm font-medium text-center" id="default-tab" data-tabs-toggle="#default-tab-content" role="tablist">
                    <li class="me-2" role="presentation">
                        <button class="inline-block p-4 border-b-2 rounded-t-lg" id="description-tab" data-tabs-target="#description" type="button" role="tab" aria-controls="description" aria-selected="false">Description</button>
                    </li>
                    <li class="me-2" role="presentation">
                        <button class="inline-block p-4 border-b-2 rounded-t-lg hover:text-gray-600 hover:border-gray-300" id="nutrition-tab" data-tabs-target="#nutrition" type="button" role="tab" aria-controls="nutrition" aria-selected="false">Nutrition</button>
                    </li>
                    <li class="me-2" role="presentation">
                        <button class="inline-block p-4 border-b-2 rounded-t-lg hover:text-gray-600 hover:border-gray-300" id="reviews-tab" data-tabs-target="#reviews" type="button" role="tab" aria-controls="reviews" aria-selected="false">Reviews</button>
                    </li>
                </ul>
            </div>
            <div id="default-tab-content">
                <div class="hidden p-4 rounded-lg" id="description" role="tabpanel" aria-labelledby="description-tab">
                    <div class="content">{!! $product->description !!}</div>
                </div>
                <div class="hidden p-4 rounded-lg" id="nutrition" role="tabpanel" aria-labelledby="nutrition-tab">
                    <div class="content">{!! $product->nutrition !!}</div>
                </div>
                <div class="hidden p-4 rounded-lg" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
                    <div>
                        <div class="justify-center text-center px-2 py-5">
                            <h1 class="justify-center text-center">Customer Reviews</h1>
                            <div class="justify-center text-center">
                                <div class="flex items-center justify-center">
                                    <div class="flex items-center">
                                        <svg class="w-4 h-4 text-yellow-300 me-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                            <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                                        </svg>
                                        <svg class="w-4 h-4 text-yellow-300 me-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                            <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                                        </svg>
                                        <svg class="w-4 h-4 text-yellow-300 me-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                            <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                                        </svg>
                                        <svg class="w-4 h-4 text-yellow-300 me-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                            <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                                        </svg>
                                        <svg class="w-4 h-4 text-gray-300 me-1 dark:text-gray-500" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                            <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                                        </svg>
                                        <p class="ms-1 text-sm font-medium text-gray-500 dark:text-gray-400">{{ $product->average_rating }}</p>
                                        <p class="ms-1 text-sm font-medium text-gray-500 dark:text-gray-400">out of</p>
                                        <p class="ms-1 text-sm font-medium text-gray-500 dark:text-gray-400">5</p>
                                    </div>
                                    <span class="w-1 h-1 mx-1.5 bg-gray-500 rounded-full dark:bg-gray-400"></span>
                                    <a href="#" class="text-sm font-medium text-gray-900 underline hover:no-underline">{{ $product->total_review }} reviews</a>
                                </div>
                            </div>
                        </div>
                        @foreach($product->review as $review)
                            <div>
                                <figure class="max-w-screen border px-2 py-2">
                                    <div class="flex items-center mb-4 text-yellow-300">
                                        <svg class="w-5 h-5 me-1" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                            <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                                        </svg>
                                        <svg class="w-5 h-5 me-1 {{ $review->rating > 1 ?'':'text-gray-300' }}" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                            <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                                        </svg>
                                        <svg class="w-5 h-5 me-1 {{ $review->rating > 2 ?'':'text-gray-300' }}" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                            <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                                        </svg>
                                        <svg class="w-5 h-5 me-1 {{ $review->rating > 3 ?'':'text-gray-300' }}" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                            <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                                        </svg>
                                        <svg class="w-4 h-4 ms-1 {{ $review->rating > 4 ?'':'text-gray-300' }}" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 22 20">
                                            <path d="M20.924 7.625a1.523 1.523 0 0 0-1.238-1.044l-5.051-.734-2.259-4.577a1.534 1.534 0 0 0-2.752 0L7.365 5.847l-5.051.734A1.535 1.535 0 0 0 1.463 9.2l3.656 3.563-.863 5.031a1.532 1.532 0 0 0 2.226 1.616L11 17.033l4.518 2.375a1.534 1.534 0 0 0 2.226-1.617l-.863-5.03L20.537 9.2a1.523 1.523 0 0 0 .387-1.575Z"/>
                                        </svg>
                                    </div>
                                    <blockquote>
                                        <p class="text-2xl font-semibold text-gray-900">
                                            {{ $review->review }}
                                        </p>
                                    </blockquote>
                                    <figcaption class="flex items-center mt-6 space-x-3 rtl:space-x-reverse">
                                        <img class="w-6 h-6 rounded-full" src="https://flowbite.s3.amazonaws.com/blocks/marketing-ui/avatars/bonnie-green.png" alt="profile picture">
                                        <div class="flex items-center divide-x-2 rtl:divide-x-reverse divide-gray-300 dark:divide-gray-700">
                                            <cite class="pe-3 font-medium text-gray-900">{{ $review->name }}</cite>
                                        </div>
                                    </figcaption>
                                </figure>
                            </div>
                        @endforeach

                    </div>
                </div>
            </div>
        </div>
    @else
        <div class="mt-6">
            <div class="grid grid-cols-1 md:grid-cols-9 gap-14">
                <div class="col-span-1 md:col-span-4">
                    <div class="grid grid-cols-8 gap-2">
                        <div class="hidden md:block">
                            <div class="grid grid-cols-1 gap-2">
                                <a data-slide-id="zoom" data-zoom-id="zoom-v" href="{{$product->img_paths['original']}}" data-image="{{$product->img_paths['original']}}" data-zoom-id="zoom-v" class="block shadow cursor-pointer hover:shadow-lg">
                                    <img src="{{$product->img_paths['small']}}" onclick="changeProductImage('{{$product->img_paths['original']}}');" width="80" height="80" alt="{{$product->title}}" class="w-full h-20 object-center object-cover">
                                </a>

                                @foreach ($product->Gallery as $gallery)
                                    <div data-slide-id="zoom" data-zoom-id="zoom-v" href="{{$gallery->paths['original']}}" data-image="{{$gallery->paths['original']}}" class="block shadow cursor-pointer hover:shadow-lg" onclick="changeProductImage('{{$gallery->paths['original']}}');">
                                        <img src="{{$gallery->paths['small']}}" width="80" height="80" alt="{{$product->title}}" class="w-full h-20 object-center object-cover">
                                    </div>
                                @endforeach
                            </div>
                        </div>

                        <div class="col-span-8 md:col-span-7">
                            <div class="zoom-gallery real">
                                <a href="{{$product->img_paths['original']}}" class="MagicZoom" id="zoom-v" data-options="zoomMode:true; zoomOn:'hover';">
                                    <img src="{{$product->img_paths['original']}}" alt="{{$product->title}}" class="w-full h-auto object-center shadow-md" width="300" height="160" id="product_preview">
                                </a>
                            </div>

                            <div class="grid grid-cols-3 md:grid-cols-5 lg:grid-cols-7 gap-2 mt-4 md:hidden">
                                <a data-slide-id="zoom" data-zoom-id="zoom-v" href="{{$product->img_paths['original']}}" data-image="{{$product->img_paths['original']}}" data-zoom-id="zoom-v" class="block shadow cursor-pointer hover:shadow-lg">
                                    <img src="{{$product->img_paths['small']}}" onclick="changeProductImage('{{$product->img_paths['original']}}');" width="80" height="80" alt="{{$product->title}}" class="w-full h-20 object-center object-cover">
                                </a>

                                @foreach ($product->Gallery as $gallery)
                                    <div data-slide-id="zoom" data-zoom-id="zoom-v" href="{{$gallery->paths['original']}}" data-image="{{$gallery->paths['original']}}" class="block shadow cursor-pointer hover:shadow-lg" onclick="changeProductImage('{{$gallery->paths['original']}}');">
                                        <img src="{{$gallery->paths['small']}}" width="80" height="80" alt="{{$product->title}}" class="w-full h-20 object-center object-cover">
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-span-1 md:col-span-5">
                    <h1 class="text-sm md:text-2xl font-medium tracking-tight text-[#222]">{{$product->title}}</h1>

                    <p class="mt-4 text-xl text-[#7d7d7d] font-medium mb-8"><span class="single_product_price">{{$product->prices['sale_price']}} Tk</span> @if($product->prices['regular_price'] > 0)<span class="text-black line-through text-xl">{{$product->prices['regular_price']}} Tk</span>@endif</p>

                    <div class="sp_variation mb-8">
                        @foreach ($product->VariableAttributes as $attribute)
                            <div><span class="mr-2 mt-2 d-inline-block"><b>{{$attribute->name}}:</b></span></div>

                            <ul class="sp_variation_all npnls overflow-hidden">
                                @foreach ($attribute->AttributeItems as $attribute_item)
                                    @if(in_array($attribute_item->id, $product->attribute_items_arr))
                                        <li>
                                            <input type="radio" name="attr_id_{{$attribute->id}}" id="av_id_{{$attribute_item->id}}" class="co_radio" value="{{$attribute->id . ':' . $attribute_item->id}}">
                                            <label for="av_id_{{$attribute_item->id}}" class="cartOptions">{{$attribute_item->name}}</label>
                                        </li>
                                    @endif
                                @endforeach
                            </ul>
                        @endforeach
                    </div>

                    <button type="button" class="hover:bg-[#222] border border-[#222] py-2 px-2 md:px-4 items-center justify-center text-base font-medium hover:text-white focus:outline-none focus:ring-2 focus:ring-offset-2 block mt-2 w-full mb-2" onclick="addToCart('{{$product->id}}')">Add to Cart</button>

                    <a style="display: block;text-align: center;" href="{{route('cart.directOrder', ['product' => $product->id])}}" class="bg-[#222] hover:bg-[#c35b58] border border-transparent py-2 px-2 md:px-4 items-center justify-center text-base font-medium text-white focus:outline-none focus:ring-2 focus:ring-offset-2 block w-full">BUY IT NOW</a>

                    <h2 class="font-semibold mb-2 text-xl mt-4">Description</h2>
                    <input name="quantity" type="hidden" value="1" id="single_cart_quantity">

                    <div class="mb-2 responsive_video">
                        {!! $product->description !!}
                    </div>
                </div>
            </div>
        </div>
    @endif

    <div class="mt-6">
        <h2 class="relative text-2xl mt-12 mb-10"><span class="w-6 md:w-16 h-0.5 bg-[#222222] inline-block mb-1.5"></span> <span class="text-black">Related Products</span> <span class="w-6 md:w-16 h-0.5 bg-[#222222] inline-block mb-1.5"></span></h2>
            @if($template == 2)
                <div class="owl-carousel_normal owl-carousel owl-theme mb-10">
                    @foreach ($related_products as $related_product)
                        @if($related_product)
                            @include('front.template2.product-loop', [
                                    'product' => $related_product
                                ])
                        @endif
                    @endforeach
                </div>
            @elseif($template == 3)
                <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-5 mb-6 gap-2 md:gap-6">
                    @foreach ($related_products as $related_product)
                        @if($related_product)
                            @include('front.template3.product-loop', [
                                    'product' => $related_product
                                ])
                        @endif
                    @endforeach
                </div>
            @else
                <div class="owl-carousel_normal owl-carousel owl-theme mb-10">
                    @foreach ($related_products as $related_product)
                        @if($related_product)
                            @include('front.layouts.product-loop', [
                                    'product' => $related_product
                                ])
                        @endif
                    @endforeach
                </div>
            @endif
    </div>
</div>
@endsection

@section('footer')
    <script src="{{asset('front/OwlCarousel/dist/owl.carousel.min.js')}}"></script>

    <script src="{{asset('front/magiczoomplus.js')}}?c=1"></script>

    <script>
        $('.owl-carousel_normal').owlCarousel({
            items: 4,
            loop: true,
            video: true,
            autoplay: true,
            autoplayTimeout: 2000,
            autoplayHoverPause: true,
            margin: 10,
            nav: true,
            dots: true,
            responsive: {
                0: {
                    items: 2,
                    margin: 10,
                },
                600: {
                    items: 2,
                    margin: 20,
                },
                1000: {
                    items: 5,
                    margin: 30,
                }
            },
            lazyLoad: false
        });
    </script>

    <script src="{{asset('front/fitvids.js/jquery.fitvids.js')}}"></script>
    <script>
        $(document).ready(function(){
            $(".responsive_video").fitVids()
        });
    </script>

    @if(env('APP_FB_TRACK'))
    <script>
        fbq('track', 'ViewContent', {
            value: '{{$product->prices["sale_price"]}}',
            currency: 'BDT',
            content_ids: '{{$product->id}}',
            content_type: 'product',
        });
    </script>
    @endif

    @if(Info::Settings('fb_api', 'track') == 'Yes')
    <script>
        // FB Conversion Track(PageView)
        $(window).on('load', function() {
            $.ajax({
                type: "POST",
                url: "{{ route('fbTrack') }}",
                data: {
                    _token: '{{csrf_token()}}',
                    track_type: 'ViewContent',
                    data: {
                        value: '{{$product->prices["sale_price"]}}',
                        currency: 'BDT',
                        content_ids: '{{$product->id}}',
                        content_type: 'product',
                    }
                },
                success: function (response) {
                    if(response == 'true'){
                        console.log('FB Tracked Page Viewed!');
                    }else{
                        console.log('FB Tracked Failed');
                    }
                },
                error: function(){
                    console.log('FB Tracked Error Page View!');
                }
            });
        });
    </script>
    @endif

    <script>
        function disChange(qty){
            let pp2 = Number({{ $product->prices['regular_price'] }});
            if(qty >= 1 && pp2 > 0){
                let r_price = Number(pp2 * qty)
                $('.price_show2').html(r_price)
            }
        }
        function inputChangeEv(type=null){
            let qty = Number($("#quantity-input").val())
            let untV = Number($("#unit_default_val").val())
            if(type == 1) qty = Number(qty + 1)
            else if(type == 0) qty = Number(qty-1)
            if(qty >= 1){
                let o_price = Number($("#price_value").val());
                let price = Number(o_price * qty)
                $('.price_show').html(price)
                $('.unit_show').html((untV * qty))
                disChange(qty)
            }
        }
        // Get Variable price
        $(document).on('change', '.co_radio', function () {
            // Get Data
            let product = "{{$product->id}}";
            let attribute_values = $("input.co_radio:checked").map(function () {
                return $(this).val();
            });

            let values = attribute_values.get();
            values = values.sort();

            // Ajax Action
            $.ajax({
                url: "{{route('product.variationPrice')}}",
                method: "POST",
                data: {values, product, _token: "{{csrf_token()}}"},
                dataType: "JSON",
                success: function (result) {
                    if(result.status == true){
                        // $('.add_to_cart').removeClass('disabled');
                        // $('.no_stock_alert').hide();
                        $('.single_product_price').html(result.sale_price);
                        $('#price_value').val(result.sale_price);
                        $('.product_data_id').val(result.product_data_id);
                        // $('.maximum_stock').val(result.stock);
                        // $('.cart_quantity_input').val(1);
                    }else{
                        $('.product_data_id').val('');
                    }
                    inputChangeEv()

                    // if(result.sku){
                    //     $('.sku_code').html(result.sku);
                    // }else{
                    //     $('.sku_code').html('N/A');
                    // }
                },
                error: function (){
                    console.log('Variation price ajax error!');
                }
            });
        });
    </script>
@endsection