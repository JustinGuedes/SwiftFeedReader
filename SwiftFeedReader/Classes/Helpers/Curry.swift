//
//  Curry.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/23.
//

func curry<A, B, C>(_ method: @escaping (A, B) -> C) -> (A) -> (B) -> C {
    return { a in
        return { b in
            return method(a, b)
        }
    }
}

func curry<A, B, C, D, E>(_ method: @escaping (A, B, C, D) -> E) -> (A) -> (B) -> (C) -> (D) -> E {
    return { a in
        return { b in
            return { c in
                return { d in
                    return method(a, b, c, d)
                }
            }
        }
    }
}

func curry<A, B, C, D, E, F>(_ method: @escaping (A, B, C, D, E) -> F) -> (A) -> (B) -> (C) -> (D) -> (E) -> F {
    return { a in
        return { b in
            return { c in
                return { d in
                    return { e in
                        return method(a, b, c, d, e)
                    }
                }
            }
        }
    }
}

func curry<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T>(_ method: @escaping (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S) -> T) -> (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> (G) -> (H) -> (I) -> (J) -> (K) -> (L) -> (M) -> (N) -> (O) -> (P) -> (Q) -> (R) -> (S) -> T {
    return { a in
        return { b in
            return { c in
                return { d in
                    return { e in
                        return { f in
                            return { g in
                                return { h in
                                    return { i in
                                        return { j in
                                            return { k in
                                                return { l in
                                                    return { m in
                                                        return { n in
                                                            return { o in
                                                                return { p in
                                                                    return { q in
                                                                        return { r in
                                                                            return { s in
                                                                                return method(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s)
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
