# Pikachu Workout 🏋️

Full home-workout Flutter app with Supabase backend.

## Included
- Onboarding and goal selection
- Supabase email/password authentication
- Dashboard, banners, streak, calories and daily workout
- Workout categories and exercise library
- Exercise animation mode and video mode
- Workout player: timer, reps, rest, pause, skip and completion
- Profile and settings
- Supabase PostgreSQL schema + Row Level Security
- GitHub Actions Android release build
- APK published as a GitHub Release asset after successful build

## Supabase
Run `supabase/schema.sql` in Supabase SQL Editor. Configure the Flutter app with public client credentials:

`flutter run --dart-define=SUPABASE_URL=https://YOUR_PROJECT.supabase.co --dart-define=SUPABASE_ANON_KEY=YOUR_ANON_KEY`

Never commit a Supabase service-role key.

## APK
The GitHub Actions workflow builds `app-release.apk` and publishes it to a GitHub Release. Use the repository **Releases** page for the current APK.

## App
**Pikachu Workout**
