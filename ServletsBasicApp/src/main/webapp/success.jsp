<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submission Successful</title>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;500;600;700&family=Inter:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

        :root {
            --bg:        #0d0b1e;
            --card:      #16122e;
            --border:    #2a2550;
            --cyan:      #00e5ff;
            --purple:    #7c5cfc;
            --pink:      #f059da;
            --text:      #e8e4ff;
            --muted:     #7b76a8;
            --radius:    20px;
        }

        body {
            background: var(--bg);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Inter', sans-serif;
            color: var(--text);
            overflow: hidden;
        }

        /* ── Particle dots background ── */
        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background-image:
                radial-gradient(circle at 20% 20%, rgba(124,92,252,0.18) 0%, transparent 50%),
                radial-gradient(circle at 80% 80%, rgba(240,89,218,0.12) 0%, transparent 50%),
                radial-gradient(1px 1px at 10% 15%, rgba(0,229,255,0.4) 0%, transparent 0%),
                radial-gradient(1px 1px at 30% 55%, rgba(124,92,252,0.5) 0%, transparent 0%),
                radial-gradient(1px 1px at 70% 20%, rgba(0,229,255,0.3) 0%, transparent 0%),
                radial-gradient(1px 1px at 90% 70%, rgba(240,89,218,0.4) 0%, transparent 0%),
                radial-gradient(1px 1px at 50% 85%, rgba(0,229,255,0.3) 0%, transparent 0%);
            pointer-events: none;
            z-index: 0;
        }

        .card {
            position: relative;
            z-index: 1;
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: var(--radius);
            padding: 52px 48px 44px;
            width: min(480px, 92vw);
            box-shadow:
                0 0 0 1px rgba(124,92,252,0.1),
                0 32px 80px rgba(0,0,0,0.6),
                0 0 60px rgba(124,92,252,0.08) inset;
            animation: slideUp 0.6s cubic-bezier(0.16, 1, 0.3, 1) both;
        }

        @keyframes slideUp {
            from { opacity: 0; transform: translateY(32px) scale(0.97); }
            to   { opacity: 1; transform: translateY(0)   scale(1);    }
        }

        /* ── Glowing top line ── */
        .card::before {
            content: '';
            position: absolute;
            top: -1px; left: 15%; right: 15%;
            height: 2px;
            background: linear-gradient(90deg, transparent, var(--purple), var(--cyan), var(--purple), transparent);
            border-radius: 999px;
        }

        /* ── Checkmark ── */
        .check-wrap {
            display: flex;
            justify-content: center;
            margin-bottom: 28px;
        }

        .check-circle {
            width: 72px; height: 72px;
            border-radius: 50%;
            background: linear-gradient(135deg, rgba(124,92,252,0.2), rgba(0,229,255,0.15));
            border: 2px solid rgba(0,229,255,0.4);
            display: flex;
            align-items: center;
            justify-content: center;
            animation: popIn 0.5s 0.4s cubic-bezier(0.34, 1.56, 0.64, 1) both;
            box-shadow: 0 0 30px rgba(0,229,255,0.2);
        }

        @keyframes popIn {
            from { opacity: 0; transform: scale(0.3); }
            to   { opacity: 1; transform: scale(1);   }
        }

        .check-svg { width: 32px; height: 32px; }
        .check-path {
            stroke: var(--cyan);
            stroke-width: 2.5;
            stroke-linecap: round;
            stroke-linejoin: round;
            fill: none;
            stroke-dasharray: 40;
            stroke-dashoffset: 40;
            animation: drawCheck 0.5s 0.85s ease-out forwards;
        }
        @keyframes drawCheck {
            to { stroke-dashoffset: 0; }
        }

        /* ── Heading ── */
        .heading {
            font-family: 'Space Grotesk', sans-serif;
            font-size: 1.7rem;
            font-weight: 700;
            text-align: center;
            letter-spacing: -0.02em;
            background: linear-gradient(120deg, #fff 30%, var(--cyan));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 6px;
        }

        .sub {
            text-align: center;
            color: var(--muted);
            font-size: 0.88rem;
            margin-bottom: 36px;
            letter-spacing: 0.01em;
        }

        /* ── Divider ── */
        .divider {
            height: 1px;
            background: linear-gradient(90deg, transparent, var(--border), transparent);
            margin-bottom: 28px;
        }

        /* ── Data grid ── */
        .grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px;
        }

        .field {
            background: rgba(255,255,255,0.03);
            border: 1px solid var(--border);
            border-radius: 12px;
            padding: 14px 16px;
            transition: border-color 0.2s, box-shadow 0.2s;
        }
        .field:hover {
            border-color: rgba(124,92,252,0.5);
            box-shadow: 0 0 18px rgba(124,92,252,0.08);
        }

        /* Full-width city field */
        .field.full { grid-column: 1 / -1; }

        .field-label {
            font-size: 0.68rem;
            font-weight: 600;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: var(--muted);
            margin-bottom: 4px;
        }
        .field-value {
            font-family: 'Space Grotesk', sans-serif;
            font-size: 1.05rem;
            font-weight: 600;
            color: var(--text);
        }

        /* Accent colors per field */
        .field.accent-cyan  .field-label { color: var(--cyan);   }
        .field.accent-purple .field-label { color: #a084fc;       }
        .field.accent-pink  .field-label { color: var(--pink);   }

        /* ── Badge ── */
        .badge {
            margin-top: 28px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            font-size: 0.78rem;
            color: var(--muted);
        }
        .badge-dot {
            width: 6px; height: 6px;
            border-radius: 50%;
            background: #22c55e;
            box-shadow: 0 0 6px #22c55e;
            animation: pulse 2s infinite;
        }
        @keyframes pulse {
            0%,100% { opacity: 1;   transform: scale(1);   }
            50%      { opacity: 0.5; transform: scale(1.4); }
        }
    </style>
</head>
<body>

    <div class="card">

        <!-- Animated checkmark -->
        <div class="check-wrap">
            <div class="check-circle">
                <svg class="check-svg" viewBox="0 0 32 32">
                    <polyline class="check-path" points="6,17 13,24 26,10"/>
                </svg>
            </div>
        </div>

        <!-- Welcome heading using JSP expression -->
        <h1 class="heading">Welcome, <%= request.getAttribute("name") %>!</h1>
        <p class="sub">Your details have been submitted successfully.</p>

        <div class="divider"></div>

        <!-- Data fields -->
        <div class="grid">
            <div class="field accent-cyan">
                <div class="field-label">User ID</div>
                <div class="field-value">#<%= request.getAttribute("id") %></div>
            </div>

            <div class="field accent-purple">
                <div class="field-label">Age</div>
                <div class="field-value"><%= request.getAttribute("age") %> yrs</div>
            </div>

            <div class="field full accent-pink">
                <div class="field-label">City</div>
                <div class="field-value"><%= request.getAttribute("city") %></div>
            </div>
        </div>

        <!-- Status badge -->
        <div class="badge">
            <span class="badge-dot"></span>
            Processed by server &mdash; Servlet → JSP
        </div>

    </div>

</body>
</html>
