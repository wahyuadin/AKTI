<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class Role
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle($request, Closure $next, $role)
    {
        // Pastikan user yang masuk memiliki peran yang sesuai
        if ($request->user() && $request->user()->role !== $role) {
            return redirect()->back();
        }

        return $next($request);
    }
}
