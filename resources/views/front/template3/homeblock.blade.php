<div class="grid gap-6 auto-rows-fr grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4">

</div>
@foreach ($home_blocks as $key => $home_block)
    <div class="flex items-center md:items-start justify-center md:justify-between flex-col md:flex-row md:gap-5 gap-2 mt-2">
        <div class="p-3 border-t w-full">
            <h2 class="text-sm md:text-xl xl:text-3xl font-bold truncate flex items-center justify-between">{{$home_block->title}}
                <a href="{{$home_block->route}}" class="px-4 py-2 font-mediu border border-black text-base hover:bg-black text-black hover:text-white">
                    <span class="">View More</span>
                </a>
                {{--<a href="{{$home_block->route}}" class="flex relative inline-block px-4 py-2 font-medium group text-base">
                    <span class="absolute inset-0 w-full h-full transition duration-200 ease-out transform translate-x-1 translate-y-1 bg-black group-hover:-translate-x-0 group-hover:-translate-y-0"></span>
                    <span class="absolute inset-0 w-full h-full bg-white border-2 border-black group-hover:bg-black"></span>
                    <span class="relative text-black group-hover:text-white transition-all">View More</span>
                </a>--}}
            </h2>
            <div class="mt-8">
                <p class="max-w-[600px] text-neutral-500">{{ $home_block->short_description }}</p>
            </div>
            @php
                $products = $home_block->Products()->latest('id')->orderBy('position')->take(5)->get();
            @endphp
            <div class="mt-5">
                {{--<div class="owl-carousel_normal owl-carousel owl-theme mb-6 h-100">
                    @foreach ($products as $product)
                        @include('front.template3.product-loop')
                    @endforeach
                </div>--}}
                <div class="grid grid-cols-2 md:grid-cols-4 lg:grid-cols-5 mb-6 gap-6 md:gap-3">
                    @foreach ($products as $key=>$product)
                        @include('front.template3.product-loop',['product'=>$product,'key'=>$key])
                    @endforeach
                </div>
            </div>
        </div>
    </div>
@endforeach