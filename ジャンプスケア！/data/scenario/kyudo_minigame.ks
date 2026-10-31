; 呼び出し例: [call storage="kyudo_minigame.ks"]
; 終了後は f.kyudo_result に success / draw / failed が設定されます。

[iscript]
(function () {
    var CONFIG = {
        width: 1280,
        height: 720,
        targetScale: 0.6,
        hitBoxRadius: 100,
        initialSwayRadius: 300,
        minSwayRadius: 100,
        swayMoveDuration: 350,
        maxHoldTime: 10.0,
        totalShots: 4,
        resultVariableName: "f.kyudo_result",
        // 画像を使う場合は index.html からの相対パスを指定します。
        backgroundImage: "",
        targetImage: "data/fgimage/something/kyudo_target.png",
        reticleImage: ""
    };

    var width = CONFIG.width;
    var height = CONFIG.height;
    var centerX = width / 2;
    var centerY = height / 2 - 20;
    var canvas = document.createElement("canvas");
    var context = canvas.getContext("2d");
    var images = {};
    var shots = [];
    var phase = "ready";
    var holding = false;
    var holdStartedAt = 0;
    var swaySegmentStartedAt = 0;
    var swayFrom = { x: 0, y: 0 };
    var swayTo = { x: 0, y: 0 };
    var gauge = 0;
    var reticleOffset = { x: 0, y: 0 };
    var aimScale = 1;
    var animationFrame = 0;
    var overlay = document.createElement("div");
    var gameFinished = false;

    canvas.width = width;
    canvas.height = height;
    canvas.style.width = "min(100vw, 177.78vh)";
    canvas.style.height = "min(100vh, 56.25vw)";
    canvas.style.display = "block";
    canvas.style.touchAction = "none";
    overlay.style.position = "fixed";
    overlay.style.left = "0";
    overlay.style.top = "0";
    overlay.style.width = "100vw";
    overlay.style.height = "100vh";
    overlay.style.zIndex = "2147483647";
    overlay.style.backgroundColor = "#111";
    overlay.style.display = "flex";
    overlay.style.alignItems = "center";
    overlay.style.justifyContent = "center";
    overlay.style.touchAction = "none";
    overlay.appendChild(canvas);
    document.body.appendChild(overlay);

    function loadImage(key, source) {
        if (!source) {
            images[key] = null;
            return;
        }
        var image = new Image();
        image.onload = function () {
            images[key] = image;
        };
        image.onerror = function () {
            console.warn("弓道ミニゲームの画像を読み込めません。Canvasの代替描画を使用します: " + source);
            images[key] = null;
        };
        image.src = source;
    }

    loadImage("background", CONFIG.backgroundImage);
    loadImage("target", CONFIG.targetImage);
    loadImage("reticle", CONFIG.reticleImage);

    function drawBackground() {
        var image = images.background;
        if (image) {
            var scale = Math.max(width / image.width, height / image.height);
            var drawWidth = image.width * scale;
            var drawHeight = image.height * scale;
            context.drawImage(image, (width - drawWidth) / 2, (height - drawHeight) / 2, drawWidth, drawHeight);
            context.fillStyle = "rgba(10, 15, 20, 0.3)";
            context.fillRect(0, 0, width, height);
            return;
        }

        var sky = context.createLinearGradient(0, 0, 0, height);
        sky.addColorStop(0, "#263642");
        sky.addColorStop(0.65, "#708078");
        sky.addColorStop(1, "#382d25");
        context.fillStyle = sky;
        context.fillRect(0, 0, width, height);
        context.fillStyle = "rgba(20, 25, 24, 0.45)";
        context.fillRect(0, 0, width, height * 0.58);
        context.fillStyle = "#493b30";
        context.fillRect(0, height * 0.72, width, height * 0.28);
        context.strokeStyle = "rgba(224, 206, 170, 0.25)";
        context.lineWidth = 3;
        context.beginPath();
        context.moveTo(0, height * 0.72);
        context.lineTo(width, height * 0.72);
        context.stroke();
        context.fillStyle = "rgba(0, 0, 0, 0.22)";
        context.fillRect(0, 0, width, height);
    }

    function drawTarget(x, y, scale) {
        var image = images.target;
        var size = 300 * CONFIG.targetScale * scale;
        if (image) {
            context.drawImage(image, x - size / 2, y - size / 2, size, size);
            return;
        }

        var rings = [
            { radius: 150, color: "#eee8d8" },
            { radius: 125, color: "#151515" },
            { radius: 100, color: "#315ba4" },
            { radius: 75, color: "#c33b35" },
            { radius: 50, color: "#e7c84c" },
            { radius: 24, color: "#e7c84c" }
        ];
        context.save();
        context.translate(x, y);
        context.scale(CONFIG.targetScale * scale, CONFIG.targetScale * scale);
        for (var i = 0; i < rings.length; i++) {
            context.beginPath();
            context.arc(0, 0, rings[i].radius, 0, Math.PI * 2);
            context.fillStyle = rings[i].color;
            context.fill();
        }
        context.restore();
    }

    function drawReticle(x, y) {
        var image = images.reticle;
        if (image) {
            context.drawImage(image, x - 28, y - 28, 56, 56);
            return;
        }
        context.save();
        context.strokeStyle = "#fff";
        context.lineWidth = 2;
        context.shadowColor = "#000";
        context.shadowBlur = 4;
        context.beginPath();
        context.arc(x, y, 18, 0, Math.PI * 2);
        context.moveTo(x - 32, y);
        context.lineTo(x - 8, y);
        context.moveTo(x + 8, y);
        context.lineTo(x + 32, y);
        context.moveTo(x, y - 32);
        context.lineTo(x, y - 8);
        context.moveTo(x, y + 8);
        context.lineTo(x, y + 32);
        context.stroke();
        context.restore();
    }

    function drawText(text, x, y, size, color, align) {
        context.font = "bold " + size + "px sans-serif";
        context.textAlign = align || "center";
        context.textBaseline = "middle";
        context.lineWidth = 4;
        context.strokeStyle = "rgba(0, 0, 0, 0.8)";
        context.strokeText(text, x, y);
        context.fillStyle = color || "#fff";
        context.fillText(text, x, y);
    }

    function drawButton(text) {
        var buttonY = 610;
        context.fillStyle = "rgba(15, 20, 20, 0.8)";
        context.fillRect(centerX - 205, buttonY - 28, 410, 56);
        context.strokeStyle = "#e7c84c";
        context.lineWidth = 2;
        context.strokeRect(centerX - 205, buttonY - 28, 410, 56);
        drawText(text, centerX, buttonY, 25, "#fff");
    }

    function drawGauge() {
        var barX = centerX - 180;
        var barY = 548;
        context.fillStyle = "rgba(0, 0, 0, 0.65)";
        context.fillRect(barX, barY, 360, 24);
        var gaugeColor = gauge >= 80 ? "#e45b43" : "#e7c84c";
        context.fillStyle = gaugeColor;
        context.fillRect(barX + 3, barY + 3, 354 * (gauge / 100), 18);
        context.strokeStyle = "#fff";
        context.lineWidth = 2;
        context.strokeRect(barX, barY, 360, 24);
        drawText("引き絞り " + Math.floor(gauge) + "%", centerX, barY - 16, 20, "#fff");
    }

    function render() {
        drawBackground();
        drawTarget(centerX, centerY, aimScale);

        for (var i = 0; i < shots.length; i++) {
            var shot = shots[i];
            context.beginPath();
            context.arc(
                centerX + shot.x,
                centerY + shot.y,
                7,
                0,
                Math.PI * 2
            );
            context.fillStyle = "#101010";
            context.fill();
            context.strokeStyle = "#f4f0e8";
            context.lineWidth = 1;
            context.stroke();
        }

        context.fillStyle = "rgba(0, 0, 0, 0.62)";
        context.fillRect(34, 30, 310, 92);
        var displayShot = phase === "result" ? shots.length : Math.min(shots.length + 1, CONFIG.totalShots);
        drawText(displayShot + "/" + CONFIG.totalShots + " 射目", 55, 62, 28, "#fff", "left");
        drawText("的中 " + shots.filter(function (shot) { return shot.hit; }).length + " 本", 55, 100, 23, "#fff", "left");

        if (phase === "ready") {
            drawText("画面を長押しして狙い、離すと矢を放ちます", centerX, 475, 26, "#fff");
            drawText("的の中心から " + CONFIG.hitBoxRadius + " px 以内で的中", centerX, 515, 19, "#f5e7b0");
            drawButton(shots.length ? "画面を押して次の射へ" : "画面を押して第一射へ");
        } else if (phase === "aim") {
            drawReticle(centerX + reticleOffset.x, centerY + reticleOffset.y);
            drawGauge();
            drawText(gauge >= 80 ? "狙いを定めて、離す！" : "長押し中…", centerX, 500, 22, "#fff");
        } else if (phase === "result") {
            var lastShot = shots[shots.length - 1];
            drawReticle(centerX + lastShot.x, centerY + lastShot.y);
            drawText(lastShot.hit ? "中り！" : (lastShot.wild ? "暴発！ ハズレ" : "ハズレ"), centerX, 470, 34, lastShot.hit ? "#ffe66a" : "#fff");
            if (shots.length >= CONFIG.totalShots) {
                var result = getResult();
                var resultLabel = result === "success" ? "成功" : (result === "draw" ? "あいこ" : "失敗");
                drawText("最終結果: " + resultLabel, centerX, 516, 25, "#fff");
                drawText("的中 " + shots.filter(function (shot) { return shot.hit; }).length + "/" + CONFIG.totalShots + " 本", centerX, 550, 20, "#f5e7b0");
                drawButton("押してシナリオへ戻る");
            } else {
                drawButton("押して次の射へ");
            }
        }

        if (phase !== "aim") {
            reticleOffset.x = 0;
            reticleOffset.y = 0;
            aimScale = 1;
        }
    }

    function getResult() {
        var hitCount = shots.filter(function (shot) { return shot.hit; }).length;
        return hitCount === CONFIG.totalShots ? "success" : (hitCount === CONFIG.totalShots - 1 ? "draw" : "failed");
    }

    function getHoldRatio(now) {
        return Math.max(0, Math.min(1, (now - holdStartedAt) / (CONFIG.maxHoldTime * 1000)));
    }

    function getSwayRadius(holdRatio) {
        return CONFIG.initialSwayRadius + (CONFIG.minSwayRadius - CONFIG.initialSwayRadius) * holdRatio;
    }

    function beginSway(now) {
        var angle = Math.random() * Math.PI * 2;
        var radius = getSwayRadius(0);
        swayFrom.x = 0;
        swayFrom.y = 0;
        swayTo.x = Math.cos(angle) * radius;
        swayTo.y = Math.sin(angle) * radius;
        swaySegmentStartedAt = now;
        reticleOffset.x = 0;
        reticleOffset.y = 0;
    }

    function updateSway(now) {
        var elapsed = now - swaySegmentStartedAt;
        while (elapsed >= CONFIG.swayMoveDuration) {
            swayFrom.x = swayTo.x;
            swayFrom.y = swayTo.y;
            var currentAngle = Math.atan2(swayFrom.y, swayFrom.x);
            var nextAngle = currentAngle + Math.PI + (Math.random() - 0.5) * (Math.PI / 2);
            swaySegmentStartedAt += CONFIG.swayMoveDuration;
            var nextRadius = getSwayRadius(getHoldRatio(swaySegmentStartedAt));
            swayTo.x = Math.cos(nextAngle) * nextRadius;
            swayTo.y = Math.sin(nextAngle) * nextRadius;
            elapsed = now - swaySegmentStartedAt;
        }

        var segmentRatio = Math.max(0, Math.min(1, elapsed / CONFIG.swayMoveDuration));
        reticleOffset.x = swayFrom.x + (swayTo.x - swayFrom.x) * segmentRatio;
        reticleOffset.y = swayFrom.y + (swayTo.y - swayFrom.y) * segmentRatio;
    }

    function finishGame() {
        if (gameFinished) {
            return;
        }
        gameFinished = true;
        f[CONFIG.resultVariableName.replace(/^f\./, "")] = getResult();
        cancelAnimationFrame(animationFrame);
        overlay.removeEventListener("pointerdown", onPointerDown);
        window.removeEventListener("pointerup", onPointerUp);
        window.removeEventListener("pointercancel", onPointerUp);
        overlay.remove();
        TYRANO.kag.ftag.startTag("return", {});
    }

    function shoot(wild) {
        if (phase !== "aim" || gameFinished) {
            return;
        }
        holding = false;
        var impactX;
        var impactY;
        var hit = false;
        if (wild) {
            var angle = Math.random() * Math.PI * 2;
            var directionX = Math.cos(angle);
            var directionY = Math.sin(angle);
            var horizontalEdge = directionX >= 0 ? width - centerX : centerX;
            var verticalEdge = directionY >= 0 ? height - centerY : centerY;
            var horizontalDistance = Math.abs(directionX) > 0.0001 ? horizontalEdge / Math.abs(directionX) : Infinity;
            var verticalDistance = Math.abs(directionY) > 0.0001 ? verticalEdge / Math.abs(directionY) : Infinity;
            var distance = Math.min(horizontalDistance, verticalDistance) + 100;
            impactX = Math.cos(angle) * distance;
            impactY = Math.sin(angle) * distance;
        } else {
            impactX = reticleOffset.x;
            impactY = reticleOffset.y;
            hit = Math.sqrt(reticleOffset.x * reticleOffset.x + reticleOffset.y * reticleOffset.y) <= CONFIG.hitBoxRadius;
        }
        shots.push({ x: impactX, y: impactY, hit: hit, wild: wild });
        phase = "result";
        gauge = wild ? 100 : gauge;
        render();
    }

    function onPointerDown(event) {
        event.preventDefault();
        if (phase === "result") {
            if (shots.length >= CONFIG.totalShots) {
                finishGame();
            } else {
                phase = "ready";
                gauge = 0;
                render();
            }
            return;
        }
        if (phase !== "ready") {
            return;
        }
        phase = "aim";
        holding = true;
        holdStartedAt = performance.now();
        beginSway(holdStartedAt);
        gauge = 0;
        if (canvas.setPointerCapture) {
            canvas.setPointerCapture(event.pointerId);
        }
        render();
    }

    function onPointerUp(event) {
        if (event) {
            event.preventDefault();
        }
        if (phase === "aim" && holding) {
            shoot(false);
        }
    }

    function update() {
        if (gameFinished) {
            return;
        }
        if (phase === "aim" && holding) {
            var now = performance.now();
            var holdRatio = getHoldRatio(now);
            gauge = holdRatio * 100;
            aimScale = 1 + holdRatio * 0.18;
            updateSway(now);
            if (gauge >= 100) {
                shoot(true);
            }
        }
        render();
        animationFrame = requestAnimationFrame(update);
    }

    overlay.addEventListener("pointerdown", onPointerDown);
    window.addEventListener("pointerup", onPointerUp);
    window.addEventListener("pointercancel", onPointerUp);
    render();
    animationFrame = requestAnimationFrame(update);
})();
[endscript]
[s]
