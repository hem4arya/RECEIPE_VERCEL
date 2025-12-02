# 🏭 Product Factory Protocol (PFP) v3.0 - "The Smart Architect"

**OBJECTIVE:** Transform _any_ raw codebase into a standardized, "Student Defense Ready" product.
**OPERATOR:** AI Agent (You)
**MODE:** Adaptive Execution.
**PRIME DIRECTIVE:** **Simplify & Standardize.** Your goal is not just to "run" the code, but to make it _accessible_. If a project uses complex infrastructure (Redis, Docker, Cloud DBs) that isn't strictly necessary for the core logic, **MIGRATE IT** to something simpler (SQLite, Local JSON) unless instructed otherwise.

---

## 🟢 PHASE 1: INTELLIGENCE & STRATEGY

**Goal:** deeply understand the project and formulate a "Simplification Strategy".

1.  **[ ] Scan & Profile**

    - List files (`ls -R`) to see the structure.
    - **CRITICAL:** Read `package.json`, `requirements.txt`, `docker-compose.yml`.
    - **Identify the "Soul":** Is this E-commerce? A Chat App? A Dashboard?

2.  **[ ] Dependency Weight Analysis (The "Smart" Step)**

    - **Identify "Heavy" Dependencies:** Redis, PostgreSQL, MongoDB (Atlas), Docker, AWS S3.
    - **Formulate Migration Plan:**
      - _Redis_ -> _SQLite_ or _Better-SQLite3_ (for cache/session).
      - _Postgres/Mongo_ -> _SQLite_ (if data volume is low/demo only).
      - _S3_ -> _Local File System_ (public folder).
    - _Decision:_ "Can I make this run on a potato?" If yes, do it.

3.  **[ ] Secrets & Config Strategy**
    - Identify **Build-time Secrets** (DB URL, Auth Secrets) vs **Runtime Secrets** (User API Keys, OpenAI Keys).
    - _Strategy:_ Build-time secrets go into `_setup/setup.js`. Runtime secrets are prompted in `WINDOWS_START.bat`.

🛑 **CHECKPOINT:** "Phase 1 Complete. Strategy: [Keep/Migrate] Database. [List] Runtime Keys. Proceed to Standardization?"

---

## 🟡 PHASE 2: STANDARDIZATION (The "Clean Room")

**Goal:** Create a uniform, predictable environment.

4.  **[ ] Purge & Refactor**

    - Delete `.git`, `node_modules`, `.env`.
    - **EXECUTE MIGRATION:** If Phase 1 identified a migration (e.g., Redis -> SQLite), perform the code refactoring now.
      - _Action:_ Install new "light" libs (`better-sqlite3`, `sqlite3`).
      - _Action:_ Rewrite connection logic.
      - _Action:_ Remove "heavy" libs from `package.json`.

5.  **[ ] Inject The Wizard (`_setup/`)**

    - **Create `_setup/project_config.json`**:
      - Only ask for _persistent_ config (e.g., Port, Local DB Name).
    - **Create `_setup/setup.js`**:
      - Interactive script to generate `.env` and initialize local DBs (if needed).
    - **vERCEL reADY**

6.  **[ ] Universal Launchers (Smart Start)**

    - **Purpose:** Create `WINDOWS_START.bat` (Windows) and `LINUX_START.sh` (Linux/Mac) in the **ROOT** directory. These are the "One-Click" entry points.
    - **Smart Start Logic (The "Brain"):**
      1.  **🔍 System Scan:**
          - Check if `node` is installed. If NOT, print a clear error or try to use a local portable version in `_setup/node`.
          - Check if `node_modules` exists.
      2.  **🛠️ Auto-Repair (Self-Healing):**
          - If `node_modules` is missing, automatically run `npm install` with a visible progress indicator.
          - If `.env` is missing, launch `_setup/setup.js` to generate it.
      3.  **🚀 Launch Sequence:**
          - Clear the terminal to keep it clean.
          - Display a "Banner" (ASCII Art) for professional feel.
          - Start the server (`npm run dev` or `serve .`).
      4.  **📢 User Guidance:**
          - **WHILE RUNNING:** "Server is starting... Please wait."
          - **ON SUCCESS:** "✅ App is live! Opening browser..."
          - **POST-EXIT:** "To stop, press Ctrl+C. To restart, run this script again."

🛑 **CHECKPOINT:** "Standardization Complete. App is simplified and launchers are ready. Proceed to Intelligent Docs?"

---

## 🟠 PHASE 3: INTELLIGENT ASSET CREATION (The "Brain" Work)

**Goal:** Author high-quality, project-specific documentation.

7.  **[ ] Deep Contextual Synthesis** - **STOP & THINK:** You are the Lead Developer you have explain this to a student who is preparing for an exam. and the pour it in step 8

8.  **[ ] Documentation "No Compromise" Policy**
    - **MANDATORY:** `docs/` folder must contain PDF and PPTX files.
    - **Tools:** Use `scripts/generate_docs.js` (or `generate_assets.js`) to automate this.
    - **Content:**
      - `01_Project_Report.pdf` (40+ Pages)
      - `02_Presentation.pptx` (Defense Ready)
      - `03_Viva_Questions.pdf` (50 Q&A)
      - `04_Synopsis.pdf` (2 Pages)
9.  **[ ] Author `_setup/project_data.json`**

        - Feed the generator with your synthesized knowledge.

    Once done, move that script to
    "D:\CLEAN\prom\scripts"

10. **[ ] Generate Artifacts**

    - Run `node generate_assets.js` (or manual fallback).

🛑 **CHECKPOINT:** "Docs Generated. Report reflects the simplified architecture. Proceed to Final Packaging?"

---

## 🔴 PHASE 4: FINAL PACKAGING

**Goal:** The "Unbox Experience".

11. **[ ] Rewrite README.md**

    - "Student Guide" focus.
    - Instructions: "1. Click WINDOWS_START.bat. 2. Enter API Key. 3. Done."

12. **[ ] Final Polish**
    - Verify `package.json` is clean.
    - Ensure no hardcoded secrets.

🛑 **CHECKPOINT:** "Protocol Complete. Project is ready for delivery. Next?"
