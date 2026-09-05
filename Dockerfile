FROM node:current-alpine
WORKDIR /app

# Use pnpm to install dependencies reproducibly from pnpm-lock.yaml
RUN npm install -g pnpm

# Install dependencies from lockfile
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml .npmrc ./
RUN pnpm install --frozen-lockfile

# Copy source
COPY . .

CMD ["pnpm", "start"]