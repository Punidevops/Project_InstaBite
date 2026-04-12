<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Insta Bite — Crave It. Order It. Love It.</title>
  <link rel="preconnect" href="https://fonts.googleapis.com"/>
  <link href="https://fonts.googleapis.com/css2?family=Syne:wght@600;700;800&family=Outfit:wght@300;400;500;600&display=swap" rel="stylesheet"/>
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    :root {
      --bg:           #080808;
      --surface:      #111111;
      --card:         #181818;
      --border:       rgba(255,255,255,0.06);
      --border-light: rgba(255,255,255,0.13);
      --orange:       #FF5722;
      --orange-dark:  #E64A19;
      --amber:        #FFB347;
      --text:         #F0EDE8;
      --muted:        #88837D;
      --star:         #FFC107;
    }

    html { scroll-behavior: smooth; }

    body {
      background: var(--bg);
      color: var(--text);
      font-family: 'Outfit', sans-serif;
      font-weight: 400;
      overflow-x: hidden;
    }

    /* ─── CURSOR ─── */
    .cur-dot {
      width: 8px; height: 8px; background: var(--orange); border-radius: 50%;
      position: fixed; top: 0; left: 0; pointer-events: none; z-index: 9999;
      transform: translate(-50%,-50%); transition: transform .08s;
    }
    .cur-ring {
      width: 34px; height: 34px; border: 1.5px solid rgba(255,87,34,.45); border-radius: 50%;
      position: fixed; top: 0; left: 0; pointer-events: none; z-index: 9998;
      transform: translate(-50%,-50%); transition: transform .18s ease, width .2s, height .2s;
    }

    /* ─── NAVBAR ─── */
    nav {
      position: fixed; top: 0; left: 0; right: 0; z-index: 100;
      padding: 0 48px; height: 70px;
      display: flex; align-items: center; justify-content: space-between;
      background: rgba(8,8,8,.65); backdrop-filter: blur(22px);
      border-bottom: 1px solid var(--border);
      transition: background .3s;
    }
    .nav-logo {
      font-family: 'Syne', sans-serif; font-size: 1.4rem; font-weight: 800;
      color: var(--text); display: flex; align-items: center; gap: 8px; letter-spacing: -.02em;
    }
    .nav-logo span { color: var(--orange); }
    .nav-links { display: flex; gap: 32px; list-style: none; }
    .nav-links a {
      color: var(--muted); text-decoration: none;
      font-size: .9rem; font-weight: 500; transition: color .2s;
    }
    .nav-links a:hover { color: var(--text); }
    .cart-btn {
      position: relative; background: var(--orange); color: #fff; border: none;
      padding: 10px 22px; border-radius: 50px;
      font-family: 'Outfit', sans-serif; font-size: .88rem; font-weight: 600;
      cursor: pointer; display: flex; align-items: center; gap: 8px;
      transition: background .2s, transform .15s;
    }
    .cart-btn:hover { background: var(--orange-dark); transform: scale(1.03); }
    .cart-count {
      background: #fff; color: var(--orange);
      width: 20px; height: 20px; border-radius: 50%;
      font-size: .72rem; font-weight: 700;
      display: flex; align-items: center; justify-content: center;
      transition: transform .3s cubic-bezier(.34,1.56,.64,1);
    }
    .cart-count.bump { transform: scale(1.5); }

    /* ─── HERO ─── */
    .hero {
      min-height: 100vh;
      display: grid; grid-template-columns: 1fr 1fr;
      align-items: center; padding: 110px 64px 80px;
      position: relative; overflow: hidden;
    }
    .hero-glow-left {
      position: absolute; top: 10%; left: -100px;
      width: 640px; height: 640px; border-radius: 50%;
      background: radial-gradient(circle, rgba(255,87,34,.13) 0%, transparent 70%);
      pointer-events: none;
    }
    .hero-glow-right {
      position: absolute; bottom: 5%; right: 15%;
      width: 400px; height: 400px; border-radius: 50%;
      background: radial-gradient(circle, rgba(255,179,71,.08) 0%, transparent 70%);
      pointer-events: none;
    }

    .hero-content { position: relative; z-index: 1; padding-right: 40px; }

    .hero-badge {
      display: inline-flex; align-items: center; gap: 9px;
      background: rgba(255,87,34,.1); border: 1px solid rgba(255,87,34,.28);
      color: var(--orange); font-size: .75rem; font-weight: 600;
      letter-spacing: .1em; text-transform: uppercase;
      padding: 7px 18px; border-radius: 50px; margin-bottom: 28px;
      animation: fadeUp .6s ease both;
    }
    .live-dot {
      width: 7px; height: 7px; border-radius: 50%; background: var(--orange);
      animation: livePulse 1.5s infinite;
    }
    @keyframes livePulse { 0%,100%{opacity:1;transform:scale(1);} 50%{opacity:.4;transform:scale(.7);} }

    .hero-title {
      font-family: 'Syne', sans-serif;
      font-size: clamp(3rem, 5.5vw, 5rem);
      font-weight: 800; line-height: 1.05; letter-spacing: -.03em;
      margin-bottom: 22px;
      animation: fadeUp .65s .1s ease both;
    }
    .hero-title .hl { color: var(--orange); }
    .hero-title .underline-word { position: relative; display: inline-block; }
    .hero-title .underline-word::after {
      content: '';
      position: absolute; bottom: -3px; left: 0; right: 0; height: 4px;
      background: linear-gradient(90deg, var(--orange), var(--amber));
      border-radius: 2px; transform: scaleX(0); transform-origin: left;
      animation: growLine .8s .6s ease forwards;
    }
    @keyframes growLine { to { transform: scaleX(1); } }

    .hero-sub {
      font-size: 1.05rem; color: var(--muted); line-height: 1.68;
      max-width: 440px; margin-bottom: 38px;
      animation: fadeUp .65s .2s ease both;
    }
    .hero-ctas {
      display: flex; gap: 14px; flex-wrap: wrap;
      margin-bottom: 52px;
      animation: fadeUp .65s .3s ease both;
    }
    .btn-fill {
      background: var(--orange); color: #fff; border: none;
      padding: 15px 34px; border-radius: 50px;
      font-family: 'Outfit', sans-serif; font-size: .95rem; font-weight: 600;
      cursor: pointer; display: inline-flex; align-items: center; gap: 8px;
      transition: background .2s, transform .2s, box-shadow .2s;
      box-shadow: 0 8px 28px rgba(255,87,34,.38);
    }
    .btn-fill:hover { background: var(--orange-dark); transform: translateY(-2px); box-shadow: 0 14px 36px rgba(255,87,34,.45); }
    .btn-ghost {
      background: transparent; color: var(--text); border: 1.5px solid var(--border-light);
      padding: 15px 34px; border-radius: 50px;
      font-family: 'Outfit', sans-serif; font-size: .95rem; font-weight: 500;
      cursor: pointer; display: inline-flex; align-items: center; gap: 8px;
      transition: border-color .2s, background .2s, transform .2s;
    }
    .btn-ghost:hover { border-color: rgba(255,255,255,.3); background: rgba(255,255,255,.05); transform: translateY(-2px); }

    .hero-stats {
      display: flex; gap: 28px;
      animation: fadeUp .65s .4s ease both;
    }
    .h-stat-num {
      font-family: 'Syne', sans-serif; font-size: 1.65rem; font-weight: 700;
    }
    .h-stat-label { font-size: .76rem; color: var(--muted); margin-top: 3px; }
    .vline { width: 1px; background: var(--border-light); align-self: stretch; }

    /* Hero Visual */
    .hero-visual {
      position: relative; z-index: 1;
      display: flex; justify-content: center; align-items: center;
      animation: fadeIn 1.1s .3s ease both;
    }
    .hero-img-wrap {
      width: 490px; height: 490px; border-radius: 50%; overflow: hidden;
      border: 2px solid rgba(255,87,34,.22);
      box-shadow: 0 0 0 22px rgba(255,87,34,.04), 0 40px 100px rgba(0,0,0,.6);
    }
    .hero-img-wrap img {
      width: 100%; height: 100%; object-fit: cover;
      transform: scale(1.04); transition: transform 9s ease;
    }
    .hero-img-wrap:hover img { transform: scale(1.12); }

    .float-card {
      position: absolute;
      background: rgba(18,18,18,.92); backdrop-filter: blur(16px);
      border: 1px solid var(--border-light); border-radius: 18px;
      padding: 13px 18px; display: flex; align-items: center; gap: 12px;
      box-shadow: 0 10px 40px rgba(0,0,0,.45);
    }
    .fc-1 { top: 55px; left: -38px; animation: float 4.5s ease-in-out infinite; }
    .fc-2 { bottom: 75px; left: -28px; animation: float 4.5s 1.5s ease-in-out infinite; }
    .fc-3 { top: 110px; right: -50px; animation: float 4.5s .8s ease-in-out infinite; }
    @keyframes float { 0%,100%{transform:translateY(0);} 50%{transform:translateY(-9px);} }
    .fc-icon { font-size: 1.6rem; }
    .fc-big { font-family: 'Syne', sans-serif; font-size: 1rem; font-weight: 700; }
    .fc-small { font-size: .7rem; color: var(--muted); margin-top: 2px; }

    /* ─── TICKER ─── */
    .ticker { background: var(--orange); padding: 13px 0; overflow: hidden; }
    .ticker-inner { display: flex; animation: tickerScroll 20s linear infinite; white-space: nowrap; }
    .t-item {
      padding: 0 30px; font-size: .82rem; font-weight: 600;
      letter-spacing: .08em; text-transform: uppercase;
      color: rgba(255,255,255,.9); display: inline-flex; align-items: center; gap: 10px; flex-shrink: 0;
    }
    .t-sep { width: 5px; height: 5px; border-radius: 50%; background: rgba(255,255,255,.45); flex-shrink: 0; }
    @keyframes tickerScroll { from{transform:translateX(0);} to{transform:translateX(-50%);} }

    /* ─── SECTION HELPERS ─── */
    .sec-eye {
      font-size: .72rem; font-weight: 600; letter-spacing: .2em;
      text-transform: uppercase; color: var(--orange); margin-bottom: 10px;
    }
    .sec-title {
      font-family: 'Syne', sans-serif;
      font-size: clamp(1.9rem, 4vw, 2.9rem); font-weight: 800;
      letter-spacing: -.03em; line-height: 1.12;
    }
    .sec-title em { color: var(--orange); font-style: normal; }

    /* ─── MENU ─── */
    .menu-sec { padding: 100px 64px; max-width: 1240px; margin: 0 auto; }
    .menu-top {
      display: flex; justify-content: space-between; align-items: flex-end;
      margin-bottom: 52px;
    }
    .filter-row { display: flex; gap: 8px; }
    .fpill {
      padding: 9px 22px; border-radius: 50px; border: 1.5px solid var(--border-light);
      background: transparent; color: var(--muted);
      font-family: 'Outfit', sans-serif; font-size: .85rem; font-weight: 500;
      cursor: pointer; transition: all .2s;
    }
    .fpill.active, .fpill:hover { background: var(--orange); border-color: var(--orange); color: #fff; }

    .menu-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 26px; }

    .mcard {
      background: var(--card); border-radius: 26px; overflow: hidden;
      border: 1px solid var(--border);
      transition: transform .35s ease, box-shadow .35s ease, border-color .35s;
      position: relative;
    }
    .mcard:hover {
      transform: translateY(-11px);
      box-shadow: 0 28px 70px rgba(0,0,0,.55), 0 0 0 1px rgba(255,87,34,.22);
      border-color: rgba(255,87,34,.22);
    }
    .mcard-img { height: 230px; overflow: hidden; position: relative; }
    .mcard-img img {
      width: 100%; height: 100%; object-fit: cover;
      transition: transform .55s ease;
    }
    .mcard:hover .mcard-img img { transform: scale(1.09); }
    .mcard-img::after {
      content: ''; position: absolute; inset: 0;
      background: linear-gradient(to bottom, transparent 45%, rgba(24,24,24,.65) 100%);
    }
    .mcard-tag {
      position: absolute; top: 14px; left: 14px; z-index: 1;
      background: var(--orange); color: #fff;
      font-size: .63rem; font-weight: 700; letter-spacing: .1em; text-transform: uppercase;
      padding: 5px 13px; border-radius: 50px;
    }
    .mcard-body { padding: 22px 24px 22px; }
    .mcard-rating { display: flex; align-items: center; gap: 6px; margin-bottom: 8px; }
    .stars-txt { color: var(--star); font-size: .8rem; }
    .r-num { font-size: .78rem; color: var(--muted); }
    .mcard-name { font-family: 'Syne', sans-serif; font-size: 1.3rem; font-weight: 700; letter-spacing: -.02em; margin-bottom: 7px; }
    .mcard-desc { font-size: .84rem; color: var(--muted); line-height: 1.58; margin-bottom: 22px; }
    .mcard-foot { display: flex; align-items: center; justify-content: space-between; }
    .mcard-price { font-family: 'Syne', sans-serif; font-size: 1.45rem; font-weight: 700; }
    .mcard-price-label { font-size: .73rem; color: var(--muted); font-family: 'Outfit', sans-serif; font-weight: 400; }
    .add-btn {
      width: 46px; height: 46px; border-radius: 50%;
      background: var(--orange); border: none; color: #fff;
      font-size: 1.4rem; cursor: pointer;
      display: flex; align-items: center; justify-content: center;
      transition: background .2s, transform .2s, box-shadow .2s;
      box-shadow: 0 4px 18px rgba(255,87,34,.35);
    }
    .add-btn:hover { background: var(--orange-dark); transform: scale(1.13); box-shadow: 0 8px 26px rgba(255,87,34,.45); }
    .add-btn:active { transform: scale(.88); }

    /* ─── WHY US ─── */
    .why-sec {
      padding: 90px 64px;
      background: var(--surface);
      border-top: 1px solid var(--border);
      border-bottom: 1px solid var(--border);
    }
    .why-inner { max-width: 1240px; margin: 0 auto; }
    .why-title { text-align: center; margin-bottom: 60px; }
    .feat-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 22px; }
    .feat-card {
      background: var(--card); border: 1px solid var(--border); border-radius: 22px;
      padding: 34px 26px; text-align: center;
      transition: transform .3s, border-color .3s, box-shadow .3s;
    }
    .feat-card:hover { transform: translateY(-7px); border-color: rgba(255,87,34,.25); box-shadow: 0 18px 50px rgba(0,0,0,.3); }
    .feat-icon {
      width: 58px; height: 58px; background: rgba(255,87,34,.1); border-radius: 18px;
      display: flex; align-items: center; justify-content: center;
      font-size: 1.65rem; margin: 0 auto 20px;
    }
    .feat-title { font-family: 'Syne', sans-serif; font-size: 1.02rem; font-weight: 700; margin-bottom: 9px; }
    .feat-desc { font-size: .82rem; color: var(--muted); line-height: 1.58; }

    /* ─── TESTIMONIALS ─── */
    .reviews-sec { padding: 100px 64px; max-width: 1240px; margin: 0 auto; }
    .reviews-head { text-align: center; margin-bottom: 52px; }
    .rev-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 22px; }
    .rev-card {
      background: var(--card); border: 1px solid var(--border); border-radius: 22px;
      padding: 30px; transition: transform .3s, border-color .3s;
    }
    .rev-card:hover { transform: translateY(-5px); border-color: rgba(255,87,34,.18); }
    .rev-stars { color: var(--star); font-size: .9rem; margin-bottom: 14px; }
    .rev-text { font-size: .88rem; color: var(--muted); line-height: 1.68; margin-bottom: 22px; font-style: italic; }
    .rev-author { display: flex; align-items: center; gap: 12px; }
    .av {
      width: 40px; height: 40px; border-radius: 50%; flex-shrink: 0;
      background: linear-gradient(135deg, var(--orange), var(--amber));
      display: flex; align-items: center; justify-content: center;
      font-weight: 700; font-size: .88rem;
    }
    .av-name { font-weight: 600; font-size: .88rem; }
    .av-loc { font-size: .74rem; color: var(--muted); margin-top: 2px; }

    /* ─── CTA BANNER ─── */
    .cta-wrap { padding: 0 64px 90px; max-width: 1240px; margin: 0 auto; }
    .cta-inner {
      background: linear-gradient(130deg, #FF5722 0%, #FF7043 45%, #E64A19 100%);
      border-radius: 30px; padding: 72px 64px;
      display: flex; align-items: center; justify-content: space-between;
      position: relative; overflow: hidden;
    }
    .cta-inner::before {
      content: ''; position: absolute; top: -80px; right: -80px;
      width: 360px; height: 360px; border-radius: 50%; background: rgba(255,255,255,.1);
    }
    .cta-inner::after {
      content: ''; position: absolute; bottom: -50px; left: 42%;
      width: 240px; height: 240px; border-radius: 50%; background: rgba(255,255,255,.06);
    }
    .cta-text { position: relative; z-index: 1; }
    .cta-eye { font-size: .73rem; font-weight: 600; letter-spacing: .15em; text-transform: uppercase; opacity: .72; margin-bottom: 10px; }
    .cta-h { font-family: 'Syne', sans-serif; font-size: 2.4rem; font-weight: 800; letter-spacing: -.03em; line-height: 1.08; }
    .cta-sub { margin-top: 10px; font-size: .95rem; opacity: .82; }
    .cta-action { position: relative; z-index: 1; flex-shrink: 0; }
    .cta-btn {
      background: #fff; color: var(--orange); border: none;
      padding: 17px 38px; border-radius: 50px;
      font-family: 'Syne', sans-serif; font-size: 1rem; font-weight: 700;
      cursor: pointer; white-space: nowrap;
      box-shadow: 0 8px 36px rgba(0,0,0,.22);
      transition: transform .2s, box-shadow .2s;
    }
    .cta-btn:hover { transform: translateY(-2px) scale(1.03); box-shadow: 0 18px 48px rgba(0,0,0,.3); }

    /* ─── FOOTER ─── */
    footer {
      background: var(--surface);
      border-top: 1px solid var(--border);
      padding: 56px 64px 34px;
    }
    .foot-top {
      display: flex; justify-content: space-between; align-items: flex-start;
      padding-bottom: 38px; border-bottom: 1px solid var(--border); margin-bottom: 28px;
      gap: 40px;
    }
    .foot-brand .nav-logo { margin-bottom: 12px; }
    .foot-brand p { font-size: .82rem; color: var(--muted); max-width: 230px; line-height: 1.65; }
    .foot-col h4 {
      font-family: 'Syne', sans-serif; font-size: .75rem; font-weight: 700;
      letter-spacing: .12em; text-transform: uppercase; color: var(--muted); margin-bottom: 16px;
    }
    .foot-col ul { list-style: none; display: flex; flex-direction: column; gap: 10px; }
    .foot-col a { color: var(--muted); text-decoration: none; font-size: .86rem; transition: color .2s; }
    .foot-col a:hover { color: var(--orange); }
    .foot-bottom { display: flex; justify-content: space-between; align-items: center; }
    .foot-copy { font-size: .78rem; color: var(--muted); }
    .foot-copy strong { color: var(--orange); }
    .foot-badge {
      display: inline-flex; align-items: center; gap: 7px;
      background: rgba(255,87,34,.1); border: 1px solid rgba(255,87,34,.2);
      padding: 7px 15px; border-radius: 50px;
      font-size: .72rem; color: var(--orange); font-weight: 600;
    }

    /* ─── CART DRAWER ─── */
    .cart-overlay {
      position: fixed; inset: 0; background: rgba(0,0,0,.65); backdrop-filter: blur(5px);
      z-index: 200; opacity: 0; pointer-events: none; transition: opacity .3s;
    }
    .cart-overlay.open { opacity: 1; pointer-events: all; }
    .cart-drawer {
      position: fixed; top: 0; right: 0; bottom: 0; width: 420px;
      background: var(--card); border-left: 1px solid var(--border-light);
      z-index: 201; transform: translateX(100%);
      transition: transform .38s cubic-bezier(.4,0,.2,1);
      display: flex; flex-direction: column;
    }
    .cart-drawer.open { transform: translateX(0); }
    .cart-head {
      padding: 24px 28px; border-bottom: 1px solid var(--border);
      display: flex; align-items: center; justify-content: space-between;
    }
    .cart-head h3 { font-family: 'Syne', sans-serif; font-size: 1.2rem; font-weight: 700; }
    .cart-close {
      width: 36px; height: 36px; border-radius: 50%;
      background: var(--surface); border: 1px solid var(--border);
      color: var(--text); font-size: 1rem; cursor: pointer;
      display: flex; align-items: center; justify-content: center; transition: all .2s;
    }
    .cart-close:hover { background: rgba(255,87,34,.15); color: var(--orange); }
    .cart-items-list { flex: 1; overflow-y: auto; padding: 20px 28px; }
    .cart-empty-state { text-align: center; padding: 60px 0; color: var(--muted); }
    .cart-empty-state .ei { font-size: 3.2rem; margin-bottom: 14px; }
    .cart-item {
      display: flex; align-items: center; gap: 14px;
      padding: 14px 0; border-bottom: 1px solid var(--border);
    }
    .ci-img { width: 56px; height: 56px; border-radius: 12px; object-fit: cover; flex-shrink: 0; }
    .ci-info { flex: 1; }
    .ci-name { font-weight: 600; font-size: .9rem; margin-bottom: 3px; }
    .ci-price { font-size: .8rem; color: var(--orange); font-weight: 600; }
    .ci-qty { display: flex; align-items: center; gap: 10px; }
    .qbtn {
      width: 28px; height: 28px; border-radius: 50%;
      background: var(--surface); border: 1px solid var(--border);
      color: var(--text); font-size: .9rem; cursor: pointer;
      display: flex; align-items: center; justify-content: center; transition: all .2s;
    }
    .qbtn:hover { background: var(--orange); border-color: var(--orange); }
    .qnum { font-weight: 600; font-size: .9rem; min-width: 16px; text-align: center; }
    .cart-foot { padding: 24px 28px; border-top: 1px solid var(--border); }
    .cart-total-row { display: flex; justify-content: space-between; margin-bottom: 18px; }
    .ctl-label { color: var(--muted); font-size: .9rem; }
    .ctl-amt { font-family: 'Syne', sans-serif; font-size: 1.35rem; font-weight: 700; }
    .checkout-btn {
      width: 100%; padding: 16px; background: var(--orange); color: #fff; border: none;
      border-radius: 14px; font-family: 'Syne', sans-serif; font-size: 1rem; font-weight: 700;
      cursor: pointer; transition: background .2s, transform .2s;
      box-shadow: 0 4px 22px rgba(255,87,34,.32);
    }
    .checkout-btn:hover { background: var(--orange-dark); transform: translateY(-1px); }

    /* ─── TOAST ─── */
    #toast {
      position: fixed; bottom: 28px; left: 50%; transform: translateX(-50%) translateY(16px);
      z-index: 300; pointer-events: none;
      background: rgba(18,18,18,.96); border: 1px solid var(--border-light);
      backdrop-filter: blur(18px); color: var(--text);
      padding: 13px 24px; border-radius: 50px;
      font-size: .88rem; font-weight: 500;
      box-shadow: 0 8px 36px rgba(0,0,0,.45);
      opacity: 0; transition: opacity .3s, transform .3s; white-space: nowrap;
    }
    #toast.show { opacity: 1; transform: translateX(-50%) translateY(0); }

    /* ─── ANIMATIONS ─── */
    @keyframes fadeUp { from{opacity:0;transform:translateY(22px);} to{opacity:1;transform:translateY(0);} }
    @keyframes fadeIn  { from{opacity:0;} to{opacity:1;} }

    .reveal { opacity: 0; transform: translateY(26px); transition: opacity .65s ease, transform .65s ease; }
    .reveal.visible { opacity: 1; transform: translateY(0); }

    /* ─── RESPONSIVE ─── */
    @media (max-width: 1060px) {
      .hero { grid-template-columns: 1fr; text-align: center; padding: 110px 40px 70px; }
      .hero-visual { display: none; }
      .hero-ctas, .hero-stats { justify-content: center; }
      .hero-sub { margin: 0 auto 38px; }
      .menu-grid, .feat-grid, .rev-grid { grid-template-columns: 1fr 1fr; }
      .menu-top { flex-direction: column; gap: 20px; align-items: flex-start; }
      .cta-inner { flex-direction: column; gap: 30px; text-align: center; }
    }
    @media (max-width: 680px) {
      nav { padding: 0 20px; }
      .nav-links { display: none; }
      .menu-grid, .feat-grid, .rev-grid { grid-template-columns: 1fr; }
      .menu-sec, .reviews-sec { padding: 60px 20px; }
      .why-sec { padding: 60px 20px; }
      .cta-wrap { padding: 0 20px 70px; }
      .cta-inner { padding: 50px 30px; }
      footer { padding: 40px 20px 28px; }
      .foot-top { flex-direction: column; }
      .cart-drawer { width: 100vw; }
      .filter-row { flex-wrap: wrap; }
    }
  </style>
</head>
<body>

<!-- Custom Cursor -->
<div class="cur-dot" id="cDot"></div>
<div class="cur-ring" id="cRing"></div>

<!-- Cart Overlay -->
<div class="cart-overlay" id="cartOverlay" onclick="closeCart()"></div>

<!-- Cart Drawer -->
<div class="cart-drawer" id="cartDrawer">
  <div class="cart-head">
    <h3>🛒 Your Order</h3>
    <button class="cart-close" onclick="closeCart()">✕</button>
  </div>
  <div class="cart-items-list" id="cartList">
    <div class="cart-empty-state">
      <div class="ei">🛍️</div>
      <div style="font-weight:600;margin-bottom:6px;">Nothing here yet</div>
      <div style="font-size:.78rem;">Add something delicious!</div>
    </div>
  </div>
  <div class="cart-foot" id="cartFoot" style="display:none">
    <div class="cart-total-row">
      <span class="ctl-label">Order Total</span>
      <span class="ctl-amt">₹<span id="cartTotal">0</span></span>
    </div>
    <button class="checkout-btn" onclick="placeOrder()">Place Order — Fast Delivery 🚀</button>
  </div>
</div>

<!-- ══════════ NAVBAR ══════════ -->
<nav id="navbar">
  <div class="nav-logo">🍔 Insta<span>Bite</span></div>
  <ul class="nav-links">
    <li><a href="#menu">Menu</a></li>
    <li><a href="#why">Why Us</a></li>
    <li><a href="#reviews">Reviews</a></li>
  </ul>
  <button class="cart-btn" onclick="openCart()">
    🛒 Cart <span class="cart-count" id="cartCount">0</span>
  </button>
</nav>

<!-- ══════════ HERO ══════════ -->
<section class="hero">
  <div class="hero-glow-left"></div>
  <div class="hero-glow-right"></div>

  <div class="hero-content">
    <div class="hero-badge">
      <span class="live-dot"></span>
      ⚡ Delivering now · 20 min avg
    </div>
    <h1 class="hero-title">
      Crave It.<br>
      <span class="hl">Order It.</span><br>
      <span class="underline-word">Love It.</span>
    </h1>
    <p class="hero-sub">
      Restaurant-quality meals from Mumbai's best kitchens — freshly made, beautifully packed, and at your door while it's still hot.
    </p>
    <div class="hero-ctas">
      <button class="btn-fill" onclick="scrollTo('menu')">🍽️ Order Now</button>
      <button class="btn-ghost" onclick="scrollTo('menu')">View Menu ↓</button>
    </div>
    <div class="hero-stats">
      <div>
        <div class="h-stat-num">50K+</div>
        <div class="h-stat-label">Happy orders</div>
      </div>
      <div class="vline"></div>
      <div>
        <div class="h-stat-num">4.9 ★</div>
        <div class="h-stat-label">App rating</div>
      </div>
      <div class="vline"></div>
      <div>
        <div class="h-stat-num">Free</div>
        <div class="h-stat-label">Delivery always</div>
      </div>
    </div>
  </div>

  <div class="hero-visual">
    <div style="position:relative;">
      <div class="hero-img-wrap">
        <img
          src="https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=900&q=88"
          alt="Delicious food spread"
        />
      </div>
      <div class="float-card fc-1">
        <div class="fc-icon">⚡</div>
        <div>
          <div class="fc-big">20 min</div>
          <div class="fc-small">Avg delivery time</div>
        </div>
      </div>
      <div class="float-card fc-2">
        <div class="fc-icon">🌿</div>
        <div>
          <div class="fc-big">100% Fresh</div>
          <div class="fc-small">Daily sourced</div>
        </div>
      </div>
      <div class="float-card fc-3">
        <div class="fc-icon">⭐</div>
        <div>
          <div class="fc-big">4.9 / 5.0</div>
          <div class="fc-small">Customer rating</div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ══════════ TICKER ══════════ -->
<div class="ticker" aria-hidden="true">
  <div class="ticker-inner">
    <span class="t-item">🍕 Crispy Thin-Crust Pizza</span><span class="t-sep"></span>
    <span class="t-item">🍔 Smash Burgers</span><span class="t-sep"></span>
    <span class="t-item">🥤 Cold-Pressed Juices</span><span class="t-sep"></span>
    <span class="t-item">⚡ Lightning-Fast Delivery</span><span class="t-sep"></span>
    <span class="t-item">🌿 Farm-Fresh Ingredients</span><span class="t-sep"></span>
    <span class="t-item">⭐ 4.9-Star Rated</span><span class="t-sep"></span>
    <span class="t-item">🎁 Free Delivery Always</span><span class="t-sep"></span>
    <!-- duplicate for seamless loop -->
    <span class="t-item">🍕 Crispy Thin-Crust Pizza</span><span class="t-sep"></span>
    <span class="t-item">🍔 Smash Burgers</span><span class="t-sep"></span>
    <span class="t-item">🥤 Cold-Pressed Juices</span><span class="t-sep"></span>
    <span class="t-item">⚡ Lightning-Fast Delivery</span><span class="t-sep"></span>
    <span class="t-item">🌿 Farm-Fresh Ingredients</span><span class="t-sep"></span>
    <span class="t-item">⭐ 4.9-Star Rated</span><span class="t-sep"></span>
    <span class="t-item">🎁 Free Delivery Always</span><span class="t-sep"></span>
  </div>
</div>

<!-- ══════════ MENU ══════════ -->
<section class="menu-sec" id="menu">
  <div class="menu-top">
    <div>
      <div class="sec-eye">Our Specialties</div>
      <h2 class="sec-title">What are you <em>craving</em><br>right now?</h2>
    </div>
    <div class="filter-row">
      <button class="fpill active" data-f="all">All</button>
      <button class="fpill" data-f="pizza">🍕 Pizza</button>
      <button class="fpill" data-f="burger">🍔 Burger</button>
      <button class="fpill" data-f="drink">🥤 Drinks</button>
    </div>
  </div>

  <div class="menu-grid">

    <!-- PIZZA -->
    <div class="mcard reveal" data-cat="pizza">
      <div class="mcard-img">
        <img
          src="https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?auto=format&fit=crop&w=700&q=85"
          alt="Loaded Margherita Pizza" loading="lazy"
        />
        <span class="mcard-tag">🔥 Bestseller</span>
      </div>
      <div class="mcard-body">
        <div class="mcard-rating">
          <span class="stars-txt">★★★★★</span>
          <span class="r-num">4.9 · 2.1k reviews</span>
        </div>
        <div class="mcard-name">Loaded Margherita</div>
        <div class="mcard-desc">Hand-tossed crust, San Marzano tomato base, fresh mozzarella di bufala & fragrant basil. Baked in a wood-fired oven at 450°C.</div>
        <div class="mcard-foot">
          <div>
            <div class="mcard-price">₹299</div>
            <div class="mcard-price-label">per serving</div>
          </div>
          <button class="add-btn" onclick="addItem('Loaded Margherita', 299, 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?auto=format&fit=crop&w=80&q=70')">+</button>
        </div>
      </div>
    </div>

    <!-- BURGER -->
    <div class="mcard reveal" data-cat="burger" style="transition-delay:.1s">
      <div class="mcard-img">
        <img
          src="https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=700&q=85"
          alt="Double Smash Burger" loading="lazy"
        />
        <span class="mcard-tag">🌟 Fan Favourite</span>
      </div>
      <div class="mcard-body">
        <div class="mcard-rating">
          <span class="stars-txt">★★★★★</span>
          <span class="r-num">4.8 · 1.6k reviews</span>
        </div>
        <div class="mcard-name">Double Smash Burger</div>
        <div class="mcard-desc">Two smashed wagyu beef patties, American cheese, caramelised onions, dill pickles & secret house sauce on a toasted brioche bun.</div>
        <div class="mcard-foot">
          <div>
            <div class="mcard-price">₹219</div>
            <div class="mcard-price-label">per serving</div>
          </div>
          <button class="add-btn" onclick="addItem('Double Smash Burger', 219, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?auto=format&fit=crop&w=80&q=70')">+</button>
        </div>
      </div>
    </div>

    <!-- JUICE -->
    <div class="mcard reveal" data-cat="drink" style="transition-delay:.2s">
      <div class="mcard-img">
        <img
          src="https://images.unsplash.com/photo-1622597467836-f3285f2131b8?auto=format&fit=crop&w=700&q=85"
          alt="Tropical Fresh Juice" loading="lazy"
        />
        <span class="mcard-tag">🌿 Zero Sugar</span>
      </div>
      <div class="mcard-body">
        <div class="mcard-rating">
          <span class="stars-txt">★★★★☆</span>
          <span class="r-num">4.7 · 890 reviews</span>
        </div>
        <div class="mcard-name">Tropical Fresh Juice</div>
        <div class="mcard-desc">Cold-pressed mango, pineapple & passion fruit blend — no added sugar, no preservatives. Pure tropical freshness in every sip.</div>
        <div class="mcard-foot">
          <div>
            <div class="mcard-price">₹99</div>
            <div class="mcard-price-label">per bottle</div>
          </div>
          <button class="add-btn" onclick="addItem('Tropical Fresh Juice', 99, 'https://images.unsplash.com/photo-1622597467836-f3285f2131b8?auto=format&fit=crop&w=80&q=70')">+</button>
        </div>
      </div>
    </div>

  </div>
</section>

<!-- ══════════ WHY US ══════════ -->
<section class="why-sec" id="why">
  <div class="why-inner">
    <div class="why-title reveal">
      <div class="sec-eye">Why Choose Us</div>
      <h2 class="sec-title">Thousands trust <em>Insta Bite</em><br>every single day</h2>
    </div>
    <div class="feat-grid">
      <div class="feat-card reveal">
        <div class="feat-icon">⚡</div>
        <div class="feat-title">Lightning Fast</div>
        <div class="feat-desc">Average delivery in under 20 minutes. Real-time GPS tracking on every order. Because hunger can't wait.</div>
      </div>
      <div class="feat-card reveal" style="transition-delay:.1s">
        <div class="feat-icon">🌿</div>
        <div class="feat-title">Farm Fresh Daily</div>
        <div class="feat-desc">Ingredients sourced fresh each morning from local farms. No frozen shortcuts — ever.</div>
      </div>
      <div class="feat-card reveal" style="transition-delay:.2s">
        <div class="feat-icon">💰</div>
        <div class="feat-title">Best Value</div>
        <div class="feat-desc">Restaurant-quality at everyday prices. Free delivery on every order. No surge pricing, no hidden fees.</div>
      </div>
      <div class="feat-card reveal" style="transition-delay:.3s">
        <div class="feat-icon">🔒</div>
        <div class="feat-title">Safe & Certified</div>
        <div class="feat-desc">FSSAI-certified kitchens. Tamper-proof, eco-friendly packaging on every single delivery.</div>
      </div>
    </div>
  </div>
</section>

<!-- ══════════ REVIEWS ══════════ -->
<section class="reviews-sec" id="reviews">
  <div class="reviews-head reveal">
    <div class="sec-eye">Customer Love</div>
    <h2 class="sec-title">Real people. Real <em>happiness.</em></h2>
  </div>
  <div class="rev-grid">
    <div class="rev-card reveal">
      <div class="rev-stars">★★★★★</div>
      <p class="rev-text">"The smash burger arrived in 17 minutes, still perfectly hot and crispy. Hands down the best delivery food I've had in Mumbai. Ordering again tonight!"</p>
      <div class="rev-author">
        <div class="av">AK</div>
        <div>
          <div class="av-name">Arjun Kulkarni</div>
          <div class="av-loc">📍 Andheri West, Mumbai</div>
        </div>
      </div>
    </div>
    <div class="rev-card reveal" style="transition-delay:.1s">
      <div class="rev-stars">★★★★★</div>
      <p class="rev-text">"Finally a food app that actually delivers on freshness. The tropical juice is my daily order now — zero sugar, incredibly refreshing. Love this brand."</p>
      <div class="rev-author">
        <div class="av">PS</div>
        <div>
          <div class="av-name">Priya Sharma</div>
          <div class="av-loc">📍 Bandra, Mumbai</div>
        </div>
      </div>
    </div>
    <div class="rev-card reveal" style="transition-delay:.2s">
      <div class="rev-stars">★★★★★</div>
      <p class="rev-text">"Ordered pizza for the whole dev team during a late sprint. Everyone was blown away. Crispy crust, perfect cheese pull. InstaBite literally saved our launch!"</p>
      <div class="rev-author">
        <div class="av">RV</div>
        <div>
          <div class="av-name">Rahul Verma</div>
          <div class="av-loc">📍 Powai, Mumbai</div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- ══════════ CTA BANNER ══════════ -->
<div class="cta-wrap">
  <div class="cta-inner reveal">
    <div class="cta-text">
      <div class="cta-eye">Limited Time Offer</div>
      <div class="cta-h">First order.<br>Free delivery.<br>Always.</div>
      <div class="cta-sub">No minimums. No hidden charges. Just great food, fast.</div>
    </div>
    <div class="cta-action">
      <button class="cta-btn" onclick="scrollTo('menu')">
        Order Now — It's Free 🚀
      </button>
    </div>
  </div>
</div>

<!-- ══════════ FOOTER ══════════ -->
<footer>
  <div class="foot-top">
    <div class="foot-brand">
      <div class="nav-logo">🍔 Insta<span>Bite</span></div>
      <p>Delicious food delivered instantly. Every craving deserves to be satisfied, right now.</p>
    </div>
    <div class="foot-col">
      <h4>Menu</h4>
      <ul>
        <li><a href="#">Pizza</a></li>
        <li><a href="#">Burgers</a></li>
        <li><a href="#">Cold Drinks</a></li>
        <li><a href="#">Combo Deals</a></li>
      </ul>
    </div>
    <div class="foot-col">
      <h4>Company</h4>
      <ul>
        <li><a href="#">About Us</a></li>
        <li><a href="#">Careers</a></li>
        <li><a href="#">Blog</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </div>
    <div class="foot-col">
      <h4>Legal</h4>
      <ul>
        <li><a href="#">Privacy Policy</a></li>
        <li><a href="#">Terms of Service</a></li>
        <li><a href="#">Refund Policy</a></li>
      </ul>
    </div>
  </div>
  <div class="foot-bottom">
    <div class="foot-copy">© 2026 <strong>InstaBite</strong> · DevOps Demo Project · Built with ❤️ in Mumbai, India</div>
    <div class="foot-badge">🔒 FSSAI Certified Kitchen</div>
  </div>
</footer>

<!-- Toast Notification -->
<div id="toast"></div>

<!-- ══════════ JAVASCRIPT ══════════ -->
<script>
  /* ── Custom Cursor ── */
  const cDot = document.getElementById('cDot');
  const cRing = document.getElementById('cRing');
  let mx = 0, my = 0, rx = 0, ry = 0;
  document.addEventListener('mousemove', e => { mx = e.clientX; my = e.clientY; });
  (function animCursor() {
    cDot.style.left = mx + 'px'; cDot.style.top = my + 'px';
    rx += (mx - rx) * 0.13; ry += (my - ry) * 0.13;
    cRing.style.left = rx + 'px'; cRing.style.top = ry + 'px';
    requestAnimationFrame(animCursor);
  })();
  document.querySelectorAll('button, a, .mcard').forEach(el => {
    el.addEventListener('mouseenter', () => {
      cRing.style.width = '50px'; cRing.style.height = '50px';
      cRing.style.borderColor = 'rgba(255,87,34,.7)';
    });
    el.addEventListener('mouseleave', () => {
      cRing.style.width = '34px'; cRing.style.height = '34px';
      cRing.style.borderColor = 'rgba(255,87,34,.45)';
    });
  });

  /* ── Cart ── */
  let cart = {};

  function addItem(name, price, img) {
    if (!cart[name]) cart[name] = { price, img, qty: 0 };
    cart[name].qty++;
    renderCart();
    showToast('✅ ' + name + ' added to cart!');
    const cc = document.getElementById('cartCount');
    cc.classList.remove('bump'); void cc.offsetWidth; cc.classList.add('bump');
    setTimeout(() => cc.classList.remove('bump'), 400);
  }

  function changeQty(name, delta) {
    if (!cart[name]) return;
    cart[name].qty += delta;
    if (cart[name].qty <= 0) delete cart[name];
    renderCart();
  }

  function renderCart() {
    const keys = Object.keys(cart);
    const total = keys.reduce((s, k) => s + cart[k].price * cart[k].qty, 0);
    const count = keys.reduce((s, k) => s + cart[k].qty, 0);
    document.getElementById('cartCount').textContent = count;
    const foot = document.getElementById('cartFoot');
    const list = document.getElementById('cartList');

    if (count === 0) {
      list.innerHTML = `<div class="cart-empty-state"><div class="ei">🛍️</div><div style="font-weight:600;margin-bottom:6px;">Nothing here yet</div><div style="font-size:.78rem;">Add something delicious!</div></div>`;
      foot.style.display = 'none';
      return;
    }

    foot.style.display = 'block';
    document.getElementById('cartTotal').textContent = total;
    list.innerHTML = keys.map(k => `
      <div class="cart-item">
        <img class="ci-img" src="${cart[k].img}" alt="${k}"/>
        <div class="ci-info">
          <div class="ci-name">${k}</div>
          <div class="ci-price">₹${cart[k].price} × ${cart[k].qty} = ₹${cart[k].price * cart[k].qty}</div>
        </div>
        <div class="ci-qty">
          <button class="qbtn" onclick="changeQty('${k}', -1)">−</button>
          <span class="qnum">${cart[k].qty}</span>
          <button class="qbtn" onclick="changeQty('${k}', 1)">+</button>
        </div>
      </div>
    `).join('');
  }

  function openCart() {
    document.getElementById('cartDrawer').classList.add('open');
    document.getElementById('cartOverlay').classList.add('open');
    document.body.style.overflow = 'hidden';
  }
  function closeCart() {
    document.getElementById('cartDrawer').classList.remove('open');
    document.getElementById('cartOverlay').classList.remove('open');
    document.body.style.overflow = '';
  }
  function placeOrder() {
    cart = {}; renderCart(); closeCart();
    showToast('🎉 Order placed! Arriving in 20 minutes.');
  }

  /* ── Toast ── */
  let toastT;
  function showToast(msg) {
    const t = document.getElementById('toast');
    t.textContent = msg; t.classList.add('show');
    clearTimeout(toastT);
    toastT = setTimeout(() => t.classList.remove('show'), 2900);
  }

  /* ── Filter Pills ── */
  document.querySelectorAll('.fpill').forEach(p => {
    p.addEventListener('click', () => {
      document.querySelectorAll('.fpill').forEach(x => x.classList.remove('active'));
      p.classList.add('active');
      const f = p.dataset.f;
      document.querySelectorAll('.mcard').forEach(c => {
        c.style.display = (f === 'all' || c.dataset.cat === f) ? '' : 'none';
      });
    });
  });

  /* ── Scroll Reveal ── */
  const ro = new IntersectionObserver(entries => {
    entries.forEach(e => { if (e.isIntersecting) { e.target.classList.add('visible'); ro.unobserve(e.target); } });
  }, { threshold: 0.1 });
  document.querySelectorAll('.reveal').forEach(el => ro.observe(el));

  /* ── Navbar scroll ── */
  window.addEventListener('scroll', () => {
    document.getElementById('navbar').style.background =
      window.scrollY > 50 ? 'rgba(8,8,8,.95)' : 'rgba(8,8,8,.65)';
  });

  /* ── Smooth scroll helper ── */
  function scrollTo(id) {
    document.getElementById(id).scrollIntoView({ behavior: 'smooth' });
  }
</script>
</body>
</html>
