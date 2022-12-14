/**
 * Copyright (c) Tiny Technologies, Inc. All rights reserved.
 * Licensed under the LGPL or a commercial license.
 * For LGPL see License.txt in the project root for license information.
 * For commercial licenses see https://www.tiny.cloud/
 *
 * Version: 5.10.0 (2021-10-11)
 */
/*!
 * Tiny FormatPainter plugin
 *
 * Copyright 2010-2021 Tiny Technologies, Inc. All rights reserved.
 *
 * Version: 1.2.0-36
 */
!function(m) {
    "use strict";
    var l = function(e) {
        var r = e
          , n = function() {
            return r
        };
        return {
            get: n,
            set: function(e) {
                r = e
            },
            clone: function() {
                return l(n())
            }
        }
    }
      , n = function(e) {
        return parseInt(e, 10)
    }
      , i = function(e, r) {
        var n = e - r;
        return 0 === n ? 0 : 0 < n ? 1 : -1
    }
      , t = function(e, r, n) {
        return {
            major: e,
            minor: r,
            patch: n
        }
    }
      , o = function(e) {
        var r = /([0-9]+)\.([0-9]+)\.([0-9]+)(?:(\-.+)?)/.exec(e);
        return r ? t(n(r[1]), n(r[2]), n(r[3])) : t(0, 0, 0)
    }
      , d = function(e, r) {
        return !!e && -1 === function(e, r) {
            var n = i(e.major, r.major);
            if (0 !== n)
                return n;
            var t = i(e.minor, r.minor);
            if (0 !== t)
                return t;
            var o = i(e.patch, r.patch);
            return 0 !== o ? o : 0
        }(o([(n = e).majorVersion, n.minorVersion].join(".").split(".").slice(0, 3).join(".")), o(r));
        var n
    }
      , a = function() {
        return (a = Object.assign || function(e) {
            for (var r, n = 1, t = arguments.length; n < t; n++)
                for (var o in r = arguments[n])
                    Object.prototype.hasOwnProperty.call(r, o) && (e[o] = r[o]);
            return e
        }
        ).apply(this, arguments)
    };
    function c() {
        for (var e = 0, r = 0, n = arguments.length; r < n; r++)
            e += arguments[r].length;
        var t = Array(e)
          , o = 0;
        for (r = 0; r < n; r++)
            for (var i = arguments[r], a = 0, u = i.length; a < u; a++,
            o++)
                t[o] = i[a];
        return t
    }
    var e, r, u, s, f, v, g, p, h, b, y, S, O, N = function() {}, w = function(e) {
        return function() {
            return e
        }
    }, T = w(!1), x = w(!0), E = function() {
        return k(0, 0)
    }, k = function(e, r) {
        return {
            major: e,
            minor: r
        }
    }, _ = {
        nu: k,
        detect: function(e, r) {
            var n = String(r).toLowerCase();
            return 0 === e.length ? E() : function(e, r) {
                var n = function(e, r) {
                    for (var n = 0; n < e.length; n++) {
                        var t = e[n];
                        if (t.test(r))
                            return t
                    }
                }(e, r);
                if (!n)
                    return {
                        major: 0,
                        minor: 0
                    };
                var t = function(e) {
                    return Number(r.replace(n, "$" + e))
                };
                return k(t(1), t(2))
            }(e, n)
        },
        unknown: E
    }, A = "Edge", D = "Chrome", C = "Opera", R = "Firefox", L = "Safari", P = function(e, r) {
        return function() {
            return r === e
        }
    }, I = function(e) {
        var r = e.current;
        return {
            current: r,
            version: e.version,
            isEdge: P(A, r),
            isChrome: P(D, r),
            isIE: P("IE", r),
            isOpera: P(C, r),
            isFirefox: P(R, r),
            isSafari: P(L, r)
        }
    }, F = {
        unknown: function() {
            return I({
                current: void 0,
                version: _.unknown()
            })
        },
        nu: I,
        edge: w(A),
        chrome: w(D),
        ie: w("IE"),
        opera: w(C),
        firefox: w(R),
        safari: w(L)
    }, M = "Windows", B = "Android", j = "Linux", U = "Solaris", V = "FreeBSD", q = "ChromeOS", z = function(e, r) {
        return function() {
            return r === e
        }
    }, X = function(e) {
        var r = e.current;
        return {
            current: r,
            version: e.version,
            isWindows: z(M, r),
            isiOS: z("iOS", r),
            isAndroid: z(B, r),
            isOSX: z("OSX", r),
            isLinux: z(j, r),
            isSolaris: z(U, r),
            isFreeBSD: z(V, r),
            isChromeOS: z(q, r)
        }
    }, H = {
        unknown: function() {
            return X({
                current: void 0,
                version: _.unknown()
            })
        },
        nu: X,
        windows: w(M),
        ios: w("iOS"),
        android: w(B),
        linux: w(j),
        osx: w("OSX"),
        solaris: w(U),
        freebsd: w(V),
        chromeos: w(q)
    }, W = function() {
        return Y
    }, Y = (e = function(e) {
        return e.isNone()
    }
    ,
    s = {
        fold: function(e, r) {
            return e()
        },
        is: T,
        isSome: T,
        isNone: x,
        getOr: u = function(e) {
            return e
        }
        ,
        getOrThunk: r = function(e) {
            return e()
        }
        ,
        getOrDie: function(e) {
            throw new Error(e || "error: getOrDie called on none.")
        },
        getOrNull: w(null),
        getOrUndefined: w(void 0),
        or: u,
        orThunk: r,
        map: W,
        each: N,
        bind: W,
        exists: T,
        forall: x,
        filter: W,
        equals: e,
        equals_: e,
        toArray: function() {
            return []
        },
        toString: w("none()")
    },
    Object.freeze && Object.freeze(s),
    s), G = function(n) {
        var e = w(n)
          , r = function() {
            return o
        }
          , t = function(e) {
            return e(n)
        }
          , o = {
            fold: function(e, r) {
                return r(n)
            },
            is: function(e) {
                return n === e
            },
            isSome: x,
            isNone: T,
            getOr: e,
            getOrThunk: e,
            getOrDie: e,
            getOrNull: e,
            getOrUndefined: e,
            or: r,
            orThunk: r,
            map: function(e) {
                return G(e(n))
            },
            each: function(e) {
                e(n)
            },
            bind: t,
            exists: t,
            forall: t,
            filter: function(e) {
                return e(n) ? o : Y
            },
            toArray: function() {
                return [n]
            },
            toString: function() {
                return "some(" + n + ")"
            },
            equals: function(e) {
                return e.is(n)
            },
            equals_: function(e, r) {
                return e.fold(T, function(e) {
                    return r(n, e)
                })
            }
        };
        return o
    }, $ = {
        some: G,
        none: W,
        from: function(e) {
            return null == e ? Y : G(e)
        }
    }, K = function(r) {
        return function(e) {
            return function(e) {
                if (null === e)
                    return "null";
                var r = typeof e;
                return "object" === r && (Array.prototype.isPrototypeOf(e) || e.constructor && "Array" === e.constructor.name) ? "array" : "object" === r && (String.prototype.isPrototypeOf(e) || e.constructor && "String" === e.constructor.name) ? "string" : r
            }(e) === r
        }
    }, Z = K("string"), J = K("array"), Q = K("boolean"), ee = K("function"), re = K("number"), ne = Array.prototype.slice, te = Array.prototype.indexOf, oe = Array.prototype.push, ie = function(e, r) {
        return n = e,
        t = r,
        -1 < te.call(n, t);
        var n, t
    }, ae = function(e, r) {
        for (var n = 0, t = e.length; n < t; n++) {
            if (r(e[n], n))
                return !0
        }
        return !1
    }, ue = function(e, r) {
        for (var n = e.length, t = new Array(n), o = 0; o < n; o++) {
            var i = e[o];
            t[o] = r(i, o)
        }
        return t
    }, ce = function(e, r) {
        for (var n = [], t = 0, o = e.length; t < o; t++) {
            var i = e[t];
            r(i, t) && n.push(i)
        }
        return n
    }, se = function(e, r) {
        for (var n = 0, t = e.length; n < t; n++) {
            var o = e[n];
            if (r(o, n))
                return $.some(o)
        }
        return $.none()
    }, fe = function(e, r) {
        return function(e) {
            for (var r = [], n = 0, t = e.length; n < t; ++n) {
                if (!J(e[n]))
                    throw new Error("Arr.flatten item " + n + " was not an array, input: " + e);
                oe.apply(r, e[n])
            }
            return r
        }(ue(e, r))
    }, me = (ee(Array.from) && Array.from,
    function(e, r) {
        var n = String(r).toLowerCase();
        return se(e, function(e) {
            return e.search(n)
        })
    }
    ), le = function(e, n) {
        return me(e, n).map(function(e) {
            var r = _.detect(e.versionRegexes, n);
            return {
                current: e.name,
                version: r
            }
        })
    }, de = function(e, n) {
        return me(e, n).map(function(e) {
            var r = _.detect(e.versionRegexes, n);
            return {
                current: e.name,
                version: r
            }
        })
    }, ve = function(e, r) {
        return -1 !== e.indexOf(r)
    }, ge = /.*?version\/\ ?([0-9]+)\.([0-9]+).*/, pe = function(r) {
        return function(e) {
            return ve(e, r)
        }
    }, he = [{
        name: "Edge",
        versionRegexes: [/.*?edge\/ ?([0-9]+)\.([0-9]+)$/],
        search: function(e) {
            return ve(e, "edge/") && ve(e, "chrome") && ve(e, "safari") && ve(e, "applewebkit")
        }
    }, {
        name: "Chrome",
        versionRegexes: [/.*?chrome\/([0-9]+)\.([0-9]+).*/, ge],
        search: function(e) {
            return ve(e, "chrome") && !ve(e, "chromeframe")
        }
    }, {
        name: "IE",
        versionRegexes: [/.*?msie\ ?([0-9]+)\.([0-9]+).*/, /.*?rv:([0-9]+)\.([0-9]+).*/],
        search: function(e) {
            return ve(e, "msie") || ve(e, "trident")
        }
    }, {
        name: "Opera",
        versionRegexes: [ge, /.*?opera\/([0-9]+)\.([0-9]+).*/],
        search: pe("opera")
    }, {
        name: "Firefox",
        versionRegexes: [/.*?firefox\/\ ?([0-9]+)\.([0-9]+).*/],
        search: pe("firefox")
    }, {
        name: "Safari",
        versionRegexes: [ge, /.*?cpu os ([0-9]+)_([0-9]+).*/],
        search: function(e) {
            return (ve(e, "safari") || ve(e, "mobile/")) && ve(e, "applewebkit")
        }
    }], be = [{
        name: "Windows",
        search: pe("win"),
        versionRegexes: [/.*?windows\ nt\ ?([0-9]+)\.([0-9]+).*/]
    }, {
        name: "iOS",
        search: function(e) {
            return ve(e, "iphone") || ve(e, "ipad")
        },
        versionRegexes: [/.*?version\/\ ?([0-9]+)\.([0-9]+).*/, /.*cpu os ([0-9]+)_([0-9]+).*/, /.*cpu iphone os ([0-9]+)_([0-9]+).*/]
    }, {
        name: "Android",
        search: pe("android"),
        versionRegexes: [/.*?android\ ?([0-9]+)\.([0-9]+).*/]
    }, {
        name: "OSX",
        search: pe("mac os x"),
        versionRegexes: [/.*?mac\ os\ x\ ?([0-9]+)_([0-9]+).*/]
    }, {
        name: "Linux",
        search: pe("linux"),
        versionRegexes: []
    }, {
        name: "Solaris",
        search: pe("sunos"),
        versionRegexes: []
    }, {
        name: "FreeBSD",
        search: pe("freebsd"),
        versionRegexes: []
    }, {
        name: "ChromeOS",
        search: pe("cros"),
        versionRegexes: [/.*?chrome\/([0-9]+)\.([0-9]+).*/]
    }], ye = {
        browsers: w(he),
        oses: w(be)
    }, Se = l(function(e, r) {
        var n, t, o, i, a, u, c, s, f, m, l, d, v = ye.browsers(), g = ye.oses(), p = le(v, e).fold(F.unknown, F.nu), h = de(g, e).fold(H.unknown, H.nu);
        return {
            browser: p,
            os: h,
            deviceType: (t = p,
            o = e,
            i = r,
            a = (n = h).isiOS() && !0 === /ipad/i.test(o),
            u = n.isiOS() && !a,
            c = n.isiOS() || n.isAndroid(),
            s = c || i("(pointer:coarse)"),
            f = a || !u && c && i("(min-device-width:768px)"),
            m = u || c && !f,
            l = t.isSafari() && n.isiOS() && !1 === /safari/i.test(o),
            d = !m && !f && !l,
            {
                isiPad: w(a),
                isiPhone: w(u),
                isTablet: w(f),
                isPhone: w(m),
                isTouch: w(s),
                isAndroid: n.isAndroid,
                isiOS: n.isiOS,
                isWebView: w(l),
                isDesktop: w(d)
            })
        }
    }(m.navigator.userAgent, function(e) {
        return m.window.matchMedia(e).matches
    })), Oe = function() {
        return Se.get()
    }, Ne = Object.keys, we = Object.hasOwnProperty, Te = function(e, r) {
        for (var n = Ne(e), t = 0, o = n.length; t < o; t++) {
            var i = n[t];
            r(e[i], i)
        }
    }, xe = function(e, t) {
        var o = {};
        return Te(e, function(e, r) {
            var n = t(e, r);
            o[n.k] = n.v
        }),
        o
    }, Ee = function(n) {
        return function(e, r) {
            n[r] = e
        }
    }, ke = function(e, r) {
        var n, t, o, i, a = {}, u = {};
        return n = e,
        t = r,
        o = Ee(a),
        i = Ee(u),
        Te(n, function(e, r) {
            (t(e, r) ? o : i)(e, r)
        }),
        {
            t: a,
            f: u
        }
    }, _e = function(e) {
        return n = function(e) {
            return e
        }
        ,
        t = [],
        Te(e, function(e, r) {
            t.push(n(e, r))
        }),
        t;
        var n, t
    }, Ae = function(e, r) {
        return De(e, r) ? $.from(e[r]) : $.none()
    }, De = function(e, r) {
        return we.call(e, r)
    }, Ce = (m.Node.ATTRIBUTE_NODE,
    m.Node.CDATA_SECTION_NODE,
    m.Node.COMMENT_NODE,
    m.Node.DOCUMENT_NODE,
    m.Node.DOCUMENT_TYPE_NODE,
    m.Node.DOCUMENT_FRAGMENT_NODE,
    m.Node.ELEMENT_NODE), Re = m.Node.TEXT_NODE, Le = (m.Node.PROCESSING_INSTRUCTION_NODE,
    m.Node.ENTITY_REFERENCE_NODE,
    m.Node.ENTITY_NODE,
    m.Node.NOTATION_NODE,
    void 0 !== m.window ? m.window : Function("return this;")(),
    f = Re,
    function(e) {
        return e.dom().nodeType === f
    }
    ), Pe = function(e, r, n) {
        !function(e, r, n) {
            if (!(Z(n) || Q(n) || re(n)))
                throw m.console.error("Invalid call to Attr.set. Key ", r, ":: Value ", n, ":: Element ", e),
                new Error("Attribute value was not simple");
            e.setAttribute(r, n + "")
        }(e.dom(), r, n)
    }, Ie = function(e, r) {
        var n = e.dom().getAttribute(r);
        return null === n ? void 0 : n
    }, Fe = function(e, r) {
        e.dom().removeAttribute(r)
    }, Me = function(e, r) {
        var n = Ie(e, r);
        return void 0 === n || "" === n ? [] : n.split(" ")
    }, Be = function(e) {
        return void 0 !== e.dom().classList
    }, je = function(e) {
        return Me(e, "class")
    }, Ue = function(e, r) {
        return o = r,
        i = Me(n = e, t = "class").concat([o]),
        Pe(n, t, i.join(" ")),
        !0;
        var n, t, o, i
    }, Ve = function(e, r) {
        return o = r,
        0 < (i = ce(Me(n = e, t = "class"), function(e) {
            return e !== o
        })).length ? Pe(n, t, i.join(" ")) : Fe(n, t),
        !1;
        var n, t, o, i
    }, qe = function(e, r) {
        var n;
        Be(e) ? e.dom().classList.remove(r) : Ve(e, r);
        0 === (Be(n = e) ? n.dom().classList : je(n)).length && Fe(n, "class")
    }, ze = function(e) {
        if (null == e)
            throw new Error("Node cannot be null or undefined");
        return {
            dom: w(e)
        }
    }, Xe = {
        fromHtml: function(e, r) {
            var n = (r || m.document).createElement("div");
            if (n.innerHTML = e,
            !n.hasChildNodes() || 1 < n.childNodes.length)
                throw m.console.error("HTML does not have a single root node", e),
                new Error("HTML must have a single root node");
            return ze(n.childNodes[0])
        },
        fromTag: function(e, r) {
            var n = (r || m.document).createElement(e);
            return ze(n)
        },
        fromText: function(e, r) {
            var n = (r || m.document).createTextNode(e);
            return ze(n)
        },
        fromDom: ze,
        fromPoint: function(e, r, n) {
            var t = e.dom();
            return $.from(t.elementFromPoint(r, n)).map(ze)
        }
    }, He = function(e, r) {
        e.fire("FormatPainterToggle", {
            state: r
        })
    };
    (g = v || (v = {})).Retrival = "Retrieval",
    g.Application = "Application",
    (h = p || (p = {})).ListSchema = "ListSchema",
    h.SubstitutionSchema = "SubstitionSchema",
    (y = b || (b = {})).InsertUnorderedList = "InsertUnorderedList",
    y.InsertOrderedList = "InsertOrderedList",
    y.InsertDefinitionList = "InsertDefinitionList",
    (O = S || (S = {})).Table = "Table",
    O.Unspecified = "Unspecified";
    var We = function(e) {
        var r, n;
        r = Xe.fromDom(e.getBody()),
        n = "tox-cursor-format-painter",
        Be(r) ? r.dom().classList.add(n) : Ue(r, n)
    }
      , Ye = function(e, r) {
        var n;
        n = e,
        qe(Xe.fromDom(n.getBody()), "tox-cursor-format-painter"),
        r.set(v.Retrival),
        He(e, !1)
    }
      , Ge = function(e, r) {
        r.get() === v.Application ? Ye(e, r) : function(r, n) {
            var t = Oe()
              , o = l(!1);
            We(r),
            n.set(v.Application),
            He(r, !0),
            r.execCommand("mceRetrieveFormats");
            var i = function() {
                r.execCommand("mcePaintFormats"),
                Ye(r, n)
            }
              , e = function() {
                n.get() === v.Application && i(),
                s()
            }
              , a = function(e) {
                n.get() === v.Application && ("touchcancel" === e.type && t.os.isAndroid() ? r.once("contextmenu", i) : o.get() ? i() : r.once("selectionchange", i)),
                s()
            }
              , u = function(e) {
                27 === e.keyCode && (Ye(r, n),
                s())
            }
              , c = function(e) {
                o.set("touchmove" === e.type)
            };
            r.on("click", e),
            r.on("touchstart touchmove", c),
            r.on("touchend touchcancel", a),
            r.on("keydown", u);
            var s = function() {
                r.off("click", e),
                r.off("touchstart touchmove", c),
                r.off("touchend touchcancel", a),
                r.off("keydown", u)
            }
        }(e, r)
    }
      , $e = function(e, r, n) {
        return 0 != (e.compareDocumentPosition(r) & n)
    }
      , Ke = function(e, r) {
        return $e(e, r, m.Node.DOCUMENT_POSITION_CONTAINED_BY)
    }
      , Ze = Ce
      , Je = function(e, r) {
        return e.dom() === r.dom()
    }
      , Qe = (Oe().browser.isIE(),
    function(e, r) {
        var n = e.dom();
        if (n.nodeType !== Ze)
            return !1;
        var t = n;
        if (void 0 !== t.matches)
            return t.matches(r);
        if (void 0 !== t.msMatchesSelector)
            return t.msMatchesSelector(r);
        if (void 0 !== t.webkitMatchesSelector)
            return t.webkitMatchesSelector(r);
        if (void 0 !== t.mozMatchesSelector)
            return t.mozMatchesSelector(r);
        throw new Error("Browser lacks native selectors")
    }
    );
    var er = function(e, r, n) {
        for (var t = e.dom(), o = ee(n) ? n : w(!1); t.parentNode; ) {
            t = t.parentNode;
            var i = Xe.fromDom(t);
            if (r(i))
                return $.some(i);
            if (o(i))
                break
        }
        return $.none()
    }
      , rr = function(e, r, n) {
        var t, o, i, a;
        return t = er,
        a = n,
        function(e, r) {
            return r(e)
        }(o = e, i = r) ? $.some(o) : ee(a) && a(o) ? $.none() : t(o, i, a)
    }
      , nr = {
        formatpainter_checklist: {
            selector: "ul",
            classes: "tox-checklist"
        },
        formatpainter_liststyletype: {
            selector: "ul,ol",
            styles: {
                listStyleType: "%value"
            }
        },
        formatpainter_borderstyle: {
            selector: "td,th",
            styles: {
                borderTopStyle: "%valueTop",
                borderRightStyle: "%valueRight",
                borderBottomStyle: "%valueBottom",
                borderLeftStyle: "%valueLeft"
            },
            remove_similar: !0
        },
        formatpainter_bordercolor: {
            selector: "td,th",
            styles: {
                borderTopColor: "%valueTop",
                borderRightColor: "%valueRight",
                borderBottomColor: "%valueBottom",
                borderLeftColor: "%valueLeft"
            },
            remove_similar: !0
        },
        formatpainter_backgroundcolor: {
            selector: "td,th",
            styles: {
                backgroundColor: "%value"
            },
            remove_similar: !0
        },
        formatpainter_removeformat: [{
            selector: "b,strong,em,i,font,u,strike,sub,sup,dfn,code,samp,kbd,var,cite,mark,q,del,ins",
            remove: "all",
            split: !0,
            expand: !1,
            block_expand: !0,
            deep: !0
        }, {
            selector: "span",
            attributes: ["style", "class"],
            remove: "empty",
            split: !0,
            expand: !1,
            deep: !0
        }, {
            selector: "*:not(tr,td,th,table)",
            attributes: ["style", "class"],
            split: !1,
            expand: !1,
            deep: !0
        }],
        formatpainter_legacy_font: {
            inline: "font",
            attributes: {
                size: "%value"
            }
        }
    }
      , tr = function(i, e) {
        return Ae(e, "selector").exists(function(e) {
            var r = i.getBody()
              , n = i.selection.getStart()
              , t = i.dom.getParents(n, w(!0), r)
              , o = i.selection.getSelectedBlocks();
            return i.dom.is(c(t, o), e)
        })
    }
      , or = function(t, e) {
        return ae(t.formatter.get(e), function(e) {
            return r = t,
            De(n = e, "inline") && !tr(r, n);
            var r, n
        })
    }
      , ir = function(t, e, r) {
        return ae(e.get(r), function(e) {
            return r = t,
            De(n = e, "block") || tr(r, n);
            var r, n
        })
    }
      , ar = function(e) {
        return 1 < e.length && "%" === e.charAt(0)
    }
      , ur = function(e, r) {
        return ae(e.formatter.get(r), function(e) {
            return n = Ae(r = e, "styles").exists(function(e) {
                return ae(_e(e), ar)
            }),
            t = Ae(r, "attributes").exists(function(e) {
                return ae(_e(e), ar)
            }),
            n || t;
            var r, n, t
        })
    }
      , cr = function(e) {
        return Qe(e, "OL,UL,DL")
    }
      , sr = function(e) {
        return Qe(e, "LI,DT,DD")
    }
      , fr = function(e, r, n) {
        var t, o = e.formatter, i = or(e, n.formatName), a = ir(e, o, n.formatName), u = (t = n.formatName,
        ie(["formatpainter_borderstyle", "formatpainter_bordercolor", "formatpainter_backgroundcolor"], t));
        (r.table && u || r.inline && i || r.block && a && !u) && o.apply(n.formatName, n.substitutedVariables)
    }
      , mr = function(e, r) {
        var n, t, o, i = function(e) {
            return Je(e, r)
        };
        return (n = rr(Xe.fromDom(e.getStart()), cr, i),
        t = rr(Xe.fromDom(e.getEnd()), cr, i),
        o = function(e, r) {
            return Je(e, r)
        }
        ,
        n.isSome() && t.isSome() ? $.some(o(n.getOrDie(), t.getOrDie())) : $.none()).getOr(!1)
    }
      , lr = function(e) {
        var r = e.selection
          , n = r.getRng()
          , t = Xe.fromDom(e.getBody())
          , o = ce(e.selection.getSelectedBlocks().map(Xe.fromDom), sr)
          , i = n.collapsed && o.length
          , a = o.length && !mr(r, t);
        return 1 < o.length || i || a
    }
      , dr = function(t, e) {
        var r, n;
        r = t,
        n = e.context,
        r.formatter.remove("formatpainter_removeformat"),
        n === S.Table && function(e, r) {
            for (var n = 0, t = e.length; n < t; n++)
                r(e[n], n)
        }(["formatpainter_borderstyle", "formatpainter_bordercolor", "formatpainter_backgroundcolor"], function(e) {
            r.formatter.remove(e)
        }),
        lr(r) && r.execCommand("RemoveList");
        var o, i, a, u, c, s, f = (a = (o = t).selection.getStart(),
        u = o.selection.getRng().collapsed,
        c = 0 < o.dom.select("td[data-mce-selected]").length,
        s = !!o.dom.getParent(a, "TABLE"),
        {
            inline: !0,
            table: u && s || c,
            block: u || (i = o.selection,
            1 < i.getSelectedBlocks().length) || c
        });
        e.schemas.forEach(function(e) {
            switch (e.kind) {
            case p.ListSchema:
                r = t,
                n = e,
                f.block && r.execCommand(n.command);
                break;
            case p.SubstitutionSchema:
                fr(t, f, e)
            }
            var r, n
        })
    }
      , vr = function(e) {
        return Be(e) ? function(e) {
            for (var r = e.dom().classList, n = new Array(r.length), t = 0; t < r.length; t++)
                n[t] = r.item(t);
            return n
        }(e) : je(e)
    }
      , gr = function(e, r) {
        var n, t, o = e.dom(), i = m.window.getComputedStyle(o).getPropertyValue(r), a = "" !== i || null != (t = Le(n = e) ? n.dom().parentNode : n.dom()) && t.ownerDocument.body.contains(t) ? i : pr(o, r);
        return null === a ? void 0 : a
    }
      , pr = function(e, r) {
        return void 0 !== (n = e).style && ee(n.style.getPropertyValue) ? e.style.getPropertyValue(r) : "";
        var n
    }
      , hr = function(o, e) {
        return xe(e, function(e, r) {
            return {
                k: e.slice(1, e.length),
                v: (n = o,
                t = r,
                "class" === t ? vr(n).filter(function(e) {
                    return !/^(mce-.*)/.test(e)
                }).join(" ") : Ie(n, t))
            };
            var n, t
        })
    }
      , br = function(e) {
        return ke(e, function(e) {
            return 1 < (r = e).length && "%" === r.charAt(0);
            var r
        }).t
    }
      , yr = function(e, n) {
        var r = Ae(e, "styles").map(function(e) {
            return t = n,
            r = br(e),
            xe(r, function(e, r) {
                return {
                    k: e.slice(1, e.length),
                    v: gr(t, (n = r,
                    n.replace(/([A-Z])/g, function(e) {
                        return "-" + e[0].toLowerCase()
                    })))
                };
                var n
            });
            var t, r
        })
          , t = Ae(e, "attributes").map(function(e) {
            return hr(n, br(e))
        })
          , o = a(a({}, r.getOr({})), t.getOr({}));
        return _e(o).every(function(e) {
            return "" !== e
        }) ? $.some(o) : $.none()
    }
      , Sr = function(e, r, n) {
        return (t = e.get(r),
        0 === t.length ? $.none() : $.some(t[0])).bind(function(e) {
            return yr(e, n)
        }).map(function(e) {
            return {
                kind: p.SubstitutionSchema,
                formatName: r,
                substitutedVariables: e
            }
        });
        var t
    }
      , Or = function(n, t) {
        return (e = n,
        r = e.getParam("formatpainter_blacklisted_formats", "link,address,removeformat,formatpainter_removeformat", "string").split(/[ ,]/),
        Ne(e.formatter.get()).filter(function(e) {
            return !ie(r, e)
        })).filter(function(e) {
            var r = ur(n, e);
            return n.formatter.matchNode(t.dom(), e, {}, r)
        });
        var e, r
    }
      , Nr = function(e) {
        return (r = e,
        se(_e(b), function(e) {
            return r.queryCommandState(e)
        })).map(function(e) {
            return {
                kind: p.ListSchema,
                command: e
            }
        });
        var r
    }
      , wr = function(e) {
        var r, n, t, o, i, a = e.dom, u = e.selection.getStart();
        return {
            schemas: c(Nr(e).toArray(), (t = e,
            o = u,
            i = t.dom.getParents(o, w(!0)),
            fe(ue(i, Xe.fromDom), function(r) {
                return fe(Or(t, r), function(e) {
                    return Sr(t.formatter, e, r).toArray()
                })
            }))),
            context: (r = a,
            n = u,
            r.getParent(n, "TABLE") ? S.Table : S.Unspecified)
        }
    }
      , Tr = function(e) {
        if (d(tinymce, "4.9.0"))
            return m.window.console.error("The format painter plugin requires at least version 4.9.0 of TinyMCE."),
            {};
        var n, r, t, o, i, a, u, c, s = l(v.Retrival), f = l({
            schemas: [],
            context: S.Unspecified
        });
        return (n = e).on("PreInit", function() {
            Te(nr, function(e, r) {
                n.formatter.get(r) || n.formatter.register(r, e)
            })
        }),
        t = s,
        o = f,
        (r = e).addCommand("mceToggleFormatPainter", function() {
            Ge(r, t)
        }),
        r.addCommand("mcePaintFormats", function() {
            r.undoManager.transact(function() {
                dr(r, o.get())
            })
        }),
        r.addCommand("mceRetrieveFormats", function() {
            o.set(wr(r))
        }),
        (i = e).ui ? (u = i).ui.registry.addToggleButton("formatpainter", {
            active: !1,
            icon: "format-painter",
            tooltip: "Format Painter",
            onAction: function() {
                return u.execCommand("mceToggleFormatPainter")
            },
            onSetup: function(r) {
                var e = function(e) {
                    r.setActive(e.state)
                };
                return u.on("FormatPainterToggle", e),
                function() {
                    return u.off("FormatPainterToggle", e)
                }
            }
        }) : (a = i).addButton("formatpainter", {
            active: !1,
            icon: "format-painter",
            tooltip: "Format Painter",
            cmd: "mceToggleFormatPainter",
            onPostRender: function(r) {
                a.on("FormatPainterToggle", function(e) {
                    r.control.active(e.state)
                })
            }
        }),
        (c = e).addShortcut("Meta+alt+C", "", function() {
            c.execCommand("mceRetrieveFormats")
        }),
        c.addShortcut("Meta+alt+V", "", function() {
            c.execCommand("mcePaintFormats")
        }),
        {}
    };
    tinymce.PluginManager.add("formatpainter", Tr)
}(window);

