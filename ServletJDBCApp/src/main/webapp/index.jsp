<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | User Portal</title>
    <meta name="description" content="Create your profile on the User Portal. Register with your details to join our system.">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Space+Grotesk:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body>

    <!-- ── Background Atmosphere ────────────────────────────── -->
    <div class="glow-orb orb-1"></div>
    <div class="glow-orb orb-2"></div>
    <div class="glow-orb orb-3"></div>
    <div class="glow-orb orb-4"></div>
    <div class="glow-orb orb-5"></div>

    <!-- ── Shooting Stars ──────────────────────────────────── -->
    <div class="shooting-star s1"></div>
    <div class="shooting-star s2"></div>
    <div class="shooting-star s3"></div>
    <div class="shooting-star s4"></div>

    <!-- ── Main Content ────────────────────────────────────── -->
    <main class="container" id="main-content">
        <section class="card" id="registration-card">

            <!-- Glassmorphism shimmer overlay -->
            <div class="card-shimmer"></div>

            <header>
                <span class="badge" id="portal-badge">
                    <svg width="10" height="10" viewBox="0 0 24 24" fill="none" style="vertical-align: -1px; margin-right: 4px;">
                        <path d="M12 2L15.09 8.26L22 9.27L17 14.14L18.18 21.02L12 17.77L5.82 21.02L7 14.14L2 9.27L8.91 8.26L12 2Z"
                              fill="currentColor" opacity="0.8"/>
                    </svg>
                    USER PORTAL
                </span>

                <h1 class="title" id="page-title">
                    Create Your <br>
                    <span class="accent">Profile</span>
                </h1>

                <p class="subtitle" id="page-subtitle">
                    Enter your details below to register in the system.
                </p>
            </header>

            <form action="RegisterServlet" method="post" class="form" id="registration-form">

                <div class="form-row">

                    <div class="field-group">
                        <label for="u_id">User ID</label>

                        <div class="input-wrapper">
                            <span class="input-icon">
                                <svg width="13" height="13" viewBox="0 0 24 24" fill="none">
                                    <path d="M4 9h16M4 15h16M10 3v18M14 3v18" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                                </svg>
                            </span>

                            <input
                                type="number"
                                id="u_id"
                                name="u_id"
                                placeholder="e.g. 1001"
                                min="1"
                                required
                                autocomplete="off"
                            >
                        </div>
                    </div>

                    <div class="field-group">
                        <label for="u_name">Full Name</label>

                        <div class="input-wrapper">
                            <span class="input-icon">
                                <svg width="13" height="13" viewBox="0 0 24 24" fill="none">
                                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2M12 11a4 4 0 1 0 0-8 4 4 0 0 0 0 8z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                            </span>

                            <input
                                type="text"
                                id="u_name"
                                name="u_name"
                                placeholder="Your name"
                                maxlength="100"
                                required
                                autocomplete="name"
                            >
                        </div>
                    </div>

                </div>

                <div class="form-row">

                    <div class="field-group">
                        <label for="u_age">Age</label>

                        <div class="input-wrapper">
                            <span class="input-icon">
                                <svg width="13" height="13" viewBox="0 0 24 24" fill="none">
                                    <circle cx="12" cy="12" r="10" stroke="currentColor" stroke-width="2"/>
                                    <path d="M12 6v6l4 2" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                                </svg>
                            </span>

                            <input
                                type="number"
                                id="u_age"
                                name="u_age"
                                placeholder="e.g. 22"
                                min="1"
                                max="120"
                                required
                                autocomplete="off"
                            >
                        </div>
                    </div>

                    <div class="field-group">
                        <label for="u_city">City</label>

                        <div class="input-wrapper">
                            <span class="input-icon">
                                <svg width="13" height="13" viewBox="0 0 24 24" fill="none">
                                    <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z" stroke="currentColor" stroke-width="2"/>
                                    <circle cx="12" cy="10" r="3" stroke="currentColor" stroke-width="2"/>
                                </svg>
                            </span>

                            <input
                                type="text"
                                id="u_city"
                                name="u_city"
                                placeholder="Your city"
                                maxlength="100"
                                required
                                autocomplete="address-level2"
                            >
                        </div>
                    </div>

                </div>

                <button type="submit" class="btn-submit" id="submit-btn">
                    <span>Register Now</span>

                    <svg
                        class="btn-arrow"
                        viewBox="0 0 16 16"
                        fill="none"
                        xmlns="http://www.w3.org/2000/svg">

                        <path
                            d="M3 8H13M13 8L9 4M13 8L9 12"
                            stroke="currentColor"
                            stroke-width="1.6"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                        />
                    </svg>
                </button>

            </form>

        </section>
    </main>

    <!-- ── Footer ──────────────────────────────────────────── -->
    <footer class="footer">
        <p class="footer-text">Powered by Space Portal &bull; &copy; 2026</p>
    </footer>

    <!-- ── Floating Particles Engine ───────────────────────── -->
    <script>
    (function () {
        'use strict';

        var palettes = [
            'rgba(124,58,237,',
            'rgba(79,70,229,',
            'rgba(167,139,250,',
            'rgba(34,211,238,',
            'rgba(129,140,248,',
            'rgba(192,132,252,'
        ];

        var particleCount = 28;

        for (var i = 0; i < particleCount; i++) {
            var p = document.createElement('div');
            p.className = 'particle';

            var size     = (Math.random() * 2.8 + 1.2).toFixed(1);
            var left     = (Math.random() * 98).toFixed(1);
            var delay    = -(Math.random() * 35).toFixed(1);
            var duration = (16 + Math.random() * 26).toFixed(1);
            var col      = palettes[Math.floor(Math.random() * palettes.length)];
            var opacity  = (0.3 + Math.random() * 0.5).toFixed(2);

            p.style.cssText = [
                'width:'              + size + 'px',
                'height:'             + size + 'px',
                'left:'               + left + 'vw',
                'bottom: -10px',
                'background:'         + col + opacity + ')',
                'box-shadow: 0 0 '    + (size * 4).toFixed(0) + 'px ' + col + (opacity * 0.8).toFixed(2) + ')',
                'animation-duration:' + duration + 's',
                'animation-delay:'    + delay + 's'
            ].join(';');

            document.body.appendChild(p);
        }
    })();
    </script>

</body>
</html>
