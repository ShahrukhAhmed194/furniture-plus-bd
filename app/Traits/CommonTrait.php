<?php
namespace App\Traits;
use Illuminate\Support\Facades\DB;

trait CommonTrait{
    /*
     * method for image upload
     * */
    protected function makeSlug($table, $title, $id=null)
    {
        $slug = preg_replace('/\s+/u', '-', trim($title));
        $product = DB::table($table)
            ->where('id', '!=', $id)
            ->where('slug', '!=', null)
            ->where('slug',$slug)->first(['id','slug']);
        //dd($product);
        if(isset($product->id)) {
            $temp_slug = $slug;
            while (1){
                $product = DB::table($table)
                    ->where('id', '!=', $id)
                    ->where('slug', '!=', null)
                    ->where('slug',$temp_slug)->first(['id','slug']);
                if(!isset($product->id)) break;
                else{
                    $temp_slug = $slug . rand(1,9999);
                }
            }
            return $temp_slug;
        }
        return $slug;
    }
}
