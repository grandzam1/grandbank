<?php

namespace App\Support;

use Illuminate\Support\Facades\Storage;

class MediaUrl
{
    /**
     * Build a domain-independent URL for a file on the public disk.
     * Returns a root-relative path (/storage/...) so images keep working
     * after domain or server changes as long as storage:link exists.
     */
    public static function publicFile(?string $path, bool $absolute = false): ?string
    {
        if (blank($path)) {
            return null;
        }

        $path = ltrim(str_replace('\\', '/', $path), '/');

        if (! str_contains($path, '/')) {
            $path = 'photos/' . $path;
        }

        if (str_starts_with($path, 'app/public/')) {
            $path = substr($path, strlen('app/public/'));
        }

        $relative = '/storage/' . $path;

        return $absolute ? url($relative) : $relative;
    }

    public static function publicFileExists(?string $path): bool
    {
        if (blank($path)) {
            return false;
        }

        $path = ltrim(str_replace('\\', '/', $path), '/');

        if (! str_contains($path, '/')) {
            $path = 'photos/' . $path;
        }

        if (str_starts_with($path, 'app/public/')) {
            $path = substr($path, strlen('app/public/'));
        }

        return Storage::disk('public')->exists($path);
    }
}
