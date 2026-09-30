# 🎬 Movie Discovery

A Netflix-inspired movie discovery app built with Flutter. Browse popular movies, trending content, upcoming releases, and search across the full TMDB catalogue — all powered by the real [TMDB API](https://developer.themoviedb.org).

---

## 📱 Screens

| Screen | Description |
|---|---|
| **Home** | Hero banner, Previews row, Popular, Trending, Top 10, New Releases, African Movies, TV Thrillers, US TV Shows |
| **Search** | Debounced live search via TMDB `/search/multi` with loader, empty, and fallback states |
| **Coming Soon** | Upcoming movies with backdrop, Remind Me, genre tags, and release date |
| **Downloads** | Static downloads placeholder screen |
| **More** | Profile switcher, Tell Friends section, My List, app settings menu |

---

## ⚙️ Setup

### Prerequisites
- Flutter SDK `^3.9.2`
- A TMDB API key (Bearer token) — [get one here](https://www.themoviedb.org/settings/api)

### Steps

```bash
# 1. Clone the repo
git clone <repo-url>
cd movie_discovery

# 2. Install dependencies
flutter pub get

# 3. Add your API key (see below)

# 4. Run the app
flutter run
```

---

## 🔑 API Key Setup

The app reads the TMDB Bearer token from a `.env` file at the project root. This file is bundled as an asset.

**1. Create a `.env` file in the project root:**

```
TMDB_API_KEY=your_token_here
```

**2. The key is loaded in `main.dart`:**

```dart
await dotenv.load(fileName: '.env');
```

**3. It is accessed in the Dio interceptor via:**

```dart
AppConstants.apiKey  // reads dotenv.env['TMDB_API_KEY']
```

> ⚠️ Never commit your `.env` file to version control. Add it to `.gitignore`.

---

## 📦 Packages Used

| Package | Version | Purpose |
|---|---|---|
| [`provider`](https://pub.dev/packages/provider) | `^6.1.5+1` | State management (`ChangeNotifier` + `Consumer`) |
| [`dio`](https://pub.dev/packages/dio) | `^5.11.1` | HTTP client with interceptors for auth headers |
| [`flutter_dotenv`](https://pub.dev/packages/flutter_dotenv) | `^6.0.1` | Load API keys from `.env` file |
| [`cached_network_image`](https://pub.dev/packages/cached_network_image) | `^3.4.1` | Efficient image loading and caching from TMDB CDN |
| [`intl`](https://pub.dev/packages/intl) | `^0.19.0` | Date formatting (e.g. "Coming October 7") |

---

## 🏗️ Architecture Overview

The app follows a **Feature-First** folder structure with a clean separation of concerns:

```
lib/
├── core/
│   ├── constants/         # UrlConstants, AssetsConstants, AppConstants
│   ├── helpers/           # AppColors
│   ├── network/           # DioClient + AppInterceptor (singleton)
│   └── utils/             # AppUtils (genre map, date formatter)
│
└── features/
    ├── home/
    │   ├── model/         # PopularMovie, TrendingResult, TvShow
    │   ├── service/       # HomeService — all TMDB endpoint calls
    │   ├── controller/    # HomeController (ChangeNotifier)
    │   └── views/         # HomeScreen + widgets
    │
    ├── search/
    │   ├── service/       # SearchService — /search/multi
    │   ├── controller/    # SearchController with 500ms debouncer
    │   └── views/         # SearchScreen + SearchItemCard widget
    │
    ├── coming_soon/
    │   ├── service/       # ComingSoonService — /movie/upcoming
    │   ├── controller/    # ComingSoonController
    │   └── views/         # ComingSoonScreen + ComingSoonCard widget
    │
    ├── downloads/         # Static screen (mock)
    ├── more/              # More screen (mock profiles + static sections)
    ├── bottom/            # BottomBarController + AppBottomBar
    └── splash/            # SplashScreen
```

### Data Flow

```
TMDB API
   ↓
DioClient (singleton + AppInterceptor injects Bearer token)
   ↓
Service (e.g. HomeService.getPopularMovies())
   ↓
Controller (ChangeNotifier — manages loader, data, error state)
   ↓
Consumer<Controller> in Widget tree → UI rebuilds
```

---

## 🌐 API-Driven vs. Mock

| Feature | Type | Endpoint |
|---|---|---|
| Popular Movies | ✅ API | `GET /movie/popular` |
| Trending Now | ✅ API | `GET /trending/all/day` |
| Top 10 Movies | ✅ API | `GET /movie/top_rated` |
| African Movies | ✅ API | `GET /discover/movie?with_origin_country=NG\|GH\|ZA...` |
| New Releases | ✅ API | `GET /movie/now_playing` |
| TV Thrillers & Mystery | ✅ API | `GET /discover/tv?with_genres=9648\|80` |
| US TV Shows | ✅ API | `GET /discover/tv?with_origin_country=US` |
| Search | ✅ API | `GET /search/multi` |
| Coming Soon | ✅ API | `GET /movie/upcoming` |
| Downloads | 🟡 Mock | Static placeholder screen — no data source |
| More / Profiles | 🟡 Mock | Local asset images — no auth or profile API |
| Previews row | 🔄 Derived | Composed from Popular + Trending + New Releases lists |

---

## 🔧 Environment

- **Platform**: iOS 15.0+ / Android (API 21+)
- **Flutter**: `^3.9.2`
- **Dart**: `^3.x`
- **Image CDN**: `https://image.tmdb.org/t/p/w500` (posters) / `original` (backdrops)
