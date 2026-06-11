# ServletsBasicApp

A hands-on Java Web project demonstrating the **complete Servlet lifecycle** and **4 methods of passing data between Servlets** using the Jakarta Servlet API on Apache Tomcat 10.

---

## What This Project Covers

- Servlet class loading, instantiation, `init()`, `service()`, and `destroy()`
- Overriding `doGet()` and `doPost()` correctly
- Passing data between two servlets using 4 different approaches
- Forwarding data to a JSP page and rendering it
- Understanding request scope vs session scope

---

## The 4 Data-Passing Methods

| # | Method | How it works | URL changes? |
|---|--------|-------------|-------------|
| 1 | `RequestDispatcher.forward()` | Same request passed to next servlet | ❌ No |
| 2 | `RequestDispatcher.include()` | Response of second servlet merged into first | ❌ No |
| 3 | `HttpSession` | Data stored in session, survives redirect | ✅ Yes |
| 4 | URL Rewriting | Data appended as query params in redirect URL | ✅ Yes |

The project ships with **Method 3 (Session Tracking)** active. Methods 1, 2, and 4 are preserved as commented-out code blocks so you can switch and experiment.

---

## Project Structure

```
ServletsBasicApp/
├── src/
│   └── main/
│       ├── java/cd D:\Backend\Projects
git add ServletsBasicApp/README.md
git commit -m "Update README"
git push
│       │   └── com/yasin/learning/tomcat1/
│       │       ├── MyServlet.java        # Entry point — reads form, sends data
│       │       └── MyServlet2.java       # Receives data, forwards to JSP
│       └── webapp/
│           ├── index.html                # Form with id, name, age, city fields
│           ├── success.jsp               # Displays submitted data
│           └── WEB-INF/
├── pom.xml
└── README.md
```

---

## Prerequisites

| Requirement | Version |
|-------------|---------|
| JDK | 17+ |
| Apache Tomcat | **10.x** (required for `jakarta.*`) |
| Maven | 3.6+ |
| IDE | IntelliJ IDEA (recommended) |

> ⚠️ **Do not use Tomcat 9 or below.** This project uses `jakarta.servlet.*` which is only supported on Tomcat 10+. Older versions use `javax.servlet.*` and will throw `ClassNotFoundException` at runtime.

---

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/ServletsBasicApp.git
cd ServletsBasicApp
```

### 2. Open in IntelliJ IDEA

- **File → Open** → select the `ServletsBasicApp` folder
- Maven will auto-import dependencies

### 3. Configure Tomcat

- **Run → Edit Configurations → + → Tomcat Server → Local**
- Under the **Deployment** tab → **+ → Artifact** → select the `.war` file
- Set Application context to `/`
- Click **Apply → OK**

### 4. Run

- Hit **Run** (`Shift + F10`)
- Browser opens at `http://localhost:8080`
- Fill in the form and submit

---

## How the Flow Works (Method 3 — Session)

```
[index.html]
     │  POST /MyServlet
     ▼
[MyServlet.doPost()]
  - Reads form parameters
  - Stores in HttpSession
  - sendRedirect → /MyServlet2        ← new request created here
     │
     ▼
[MyServlet2.doGet()]
  - Reads from HttpSession
  - Copies to request attributes       ← needed so JSP can read ${id} etc.
  - forward → /success.jsp
     │
     ▼
[success.jsp]
  - Renders id, name, age, city
```

### Why `req.setAttribute()` is needed before forwarding to JSP

```java
// Session holds the data ✅
session.setAttribute("id", id);

// But ${id} in JSP resolves from REQUEST scope first
// So you must copy it:
req.setAttribute("id", id);   // ✅ now JSP can read ${id}

rd.forward(req, resp);
```

| Expression in JSP | Reads from |
|-------------------|-----------|
| `${id}` | Request scope |
| `${sessionScope.id}` | Session scope |
| `${param.id}` | Query parameter |

---

## Switching Between Methods

Open `MyServlet.java` and `MyServlet2.java`. Each method is clearly labeled:

```java
/*
 * METHOD 1 : RequestDispatcher + forward()
 */
// req.setAttribute("id", id);
// RequestDispatcher rd = req.getRequestDispatcher("/MyServlet2");
// rd.forward(req, resp);
```

To switch, comment out the active method and uncomment the one you want to try. No other changes required.

---

## Servlet Lifecycle — Console Output

On first request you will see this sequence in the Tomcat console:

```
MyServlet is loaded...              ← static block  (class loading)
MyServlet object is created         ← constructor   (instantiation)
MyServlet obj is initialized        ← init()
Service1: running...                ← service()
doPost1 - Before Starting MyServlet2
doPost1 - After Ending MyServlet2
Service1: ending...
Service method of MyServlet2 is running...
ID   : 101
Name : John
Age  : 25
City : Dhaka
Service method of MyServlet2 is ending...
```

> Notice that `doPost1 - After Ending MyServlet2` prints **before** MyServlet2 runs. This is because `sendRedirect()` does not block — execution continues in MyServlet while the browser makes a new request to MyServlet2.

---

## Common Issues

| Symptom | Likely Cause | Fix |
|---------|-------------|-----|
| `ClassNotFoundException: jakarta.servlet` | Tomcat 9 or below | Use Tomcat 10+ |
| `NullPointerException` on session attributes | Session expired or never created | Check `getSession(false)` — use `getSession()` if session must be created |
| JSP shows blank values | Data not copied to request scope | Add `req.setAttribute()` before `rd.forward()` |
| 404 on `/MyServlet2` | Annotation not picked up | Verify `@WebServlet("/MyServlet2")` is present and Tomcat redeployed |

---

## Dependencies

```xml
<dependency>
    <groupId>jakarta.servlet</groupId>
    <artifactId>jakarta.servlet-api</artifactId>
    <version>6.0.0</version>
    <scope>provided</scope>
</dependency>
```

`provided` scope means the JAR is supplied by Tomcat at runtime and will not be bundled into the WAR file.

---

## License

This project is open source and available under the [MIT License](LICENSE).

---

*Learning Java Web Development — one servlet at a time.*
