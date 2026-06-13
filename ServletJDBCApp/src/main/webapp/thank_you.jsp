<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Pull the username set by RegisterServlet
    String uName = (String) request.getAttribute("u_name");
    if (uName == null || uName.trim().isEmpty()) uName = "User";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success — User Portal</title>
    <meta name="description" content="Registration successful. Your profile has been created on the User Portal.">

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

    <!-- ── Page Content ────────────────────────────────────── -->
    <main class="container" id="main-content">
        <div class="card success-card" id="success-card">

            <!-- Glassmorphism shimmer overlay -->
            <div class="card-shimmer"></div>

            <!-- Animated check icon with orbit + ripples -->
            <div class="icon-stage">
                <!-- Expanding ripple rings -->
                <div class="ripple-ring rr1"></div>
                <div class="ripple-ring rr2"></div>
                <div class="ripple-ring rr3"></div>

                <!-- Orbiting sparkle dots -->
                <div class="orbit-ring">
                    <span class="o-dot"></span>
                    <span class="o-dot"></span>
                    <span class="o-dot"></span>
                </div>

                <!-- Green check circle -->
                <div class="success-icon">
                    <svg width="28" height="28" viewBox="0 0 24 24" fill="none"
                         xmlns="http://www.w3.org/2000/svg">
                        <path d="M20 6L9 17L4 12"
                              stroke="#10B981"
                              stroke-width="2.5"
                              stroke-linecap="round"
                              stroke-linejoin="round"/>
                    </svg>
                </div>
            </div>

            <span class="badge" id="success-badge">
                <svg width="10" height="10" viewBox="0 0 24 24" fill="none" style="vertical-align: -1px; margin-right: 4px;">
                    <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14" stroke="currentColor" stroke-width="2.5" stroke-linecap="round"/>
                    <path d="M22 4L12 14.01l-3-3" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
                SUCCESS
            </span>

            <!-- Personalised headline -->
            <h1 class="title" id="success-title">
                Thank you,&nbsp;<span class="highlight-name"><%= uName %></span>!
            </h1>

            <!-- Confirmation message -->
            <div class="success-msg" id="success-message">
                <span>✓</span>Your info has been successfully added to the system.
            </div>

            <!-- Back link -->
            <a href="index.jsp" class="back-link" id="back-link">
                <svg width="14" height="14" viewBox="0 0 16 16" fill="none"
                     xmlns="http://www.w3.org/2000/svg">
                    <path d="M13 8H3M3 8L7 4M3 8L7 12"
                          stroke="currentColor"
                          stroke-width="1.6"
                          stroke-linecap="round"
                          stroke-linejoin="round"/>
                </svg>
                Register another user
            </a>

        </div>
    </main>

    <!-- ── Footer ──────────────────────────────────────────── -->
    <footer class="footer">
        <p class="footer-text">Powered by Space Portal &bull; &copy; 2026</p>
    </footer>

    <!-- ── Particles & Confetti ────────────────────────────── -->
    <script>
    (function () {
        'use strict';

        /* ── Floating particles ──────────────────────────── */
        var palettes = [
            'rgba(124,58,237,',
            'rgba(79,70,229,',
            'rgba(167,139,250,',
            'rgba(34,211,238,',
            'rgba(16,185,129,',
            'rgba(192,132,252,'
        ];

        for (var i = 0; i < 24; i++) {
            var p = document.createElement('div');
            p.className = 'particle';
            var size     = (Math.random() * 2.5 + 1.5).toFixed(1);
            var left     = (Math.random() * 98).toFixed(1);
            var delay    = -(Math.random() * 30).toFixed(1);
            var duration = (14 + Math.random() * 22).toFixed(1);
            var col      = palettes[Math.floor(Math.random() * palettes.length)];
            var opacity  = (0.35 + Math.random() * 0.45).toFixed(2);

            p.style.cssText = [
                'width:'                + size + 'px',
                'height:'               + size + 'px',
                'left:'                 + left + 'vw',
                'bottom: -8px',
                'background:'           + col + opacity + ')',
                'box-shadow: 0 0 '      + (size * 3.5).toFixed(0) + 'px ' + col + (opacity * 0.85).toFixed(2) + ')',
                'animation-duration:'   + duration + 's',
                'animation-delay:'      + delay + 's'
            ].join(';');

            document.body.appendChild(p);
        }

        /* ── Confetti burst on load ──────────────────────── */
        var confettiColors = [
            '#7C3AED', '#A78BFA', '#4F46E5',
            '#22D3EE', '#10B981', '#C084FC', '#818CF8'
        ];
        var count = 48;

        for (var j = 0; j < count; j++) {
            (function (index) {
                var el   = document.createElement('div');
                var size = (Math.random() * 6 + 3).toFixed(0);
                var angle    = (index / count) * Math.PI * 2 + (Math.random() - 0.5) * 0.6;
                var distance = 75 + Math.random() * 240;
                var tx   = (Math.cos(angle) * distance).toFixed(0);
                var ty   = (Math.sin(angle) * distance).toFixed(0);
                var rot  = ((Math.random() * 720) - 360).toFixed(0);
                var dur  = (0.75 + Math.random() * 0.65).toFixed(2);
                var del  = (Math.random() * 0.25).toFixed(3);
                var col  = confettiColors[Math.floor(Math.random() * confettiColors.length)];
                var isRound = Math.random() > 0.45;

                el.style.cssText = [
                    'position:fixed',
                    'width:'          + size + 'px',
                    'height:'         + size + 'px',
                    'background:'     + col,
                    'border-radius:'  + (isRound ? '50%' : '2px'),
                    'top:50%',
                    'left:50%',
                    'pointer-events:none',
                    'z-index:999',
                    '--cx:'           + tx + 'px',
                    '--cy:'           + ty + 'px',
                    '--cr:'           + rot + 'deg',
                    'animation:confetti-burst ' + dur + 's ease-out ' + del + 's forwards',
                    'box-shadow: 0 0 8px ' + col
                ].join(';');

                document.body.appendChild(el);
                setTimeout(function () { el.remove(); }, (parseFloat(dur) + parseFloat(del) + 0.1) * 1000);
            })(j);
        }
    })();
    </script>

</body>
</html>
